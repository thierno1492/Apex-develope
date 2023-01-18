import { LightningElement, api,track  } from 'lwc';
import makeGetCallout from '@salesforce/apex/AnimalsCallouts.makeGetCallout';
import nextCallouts from '@salesforce/apex/AnimalsCallouts.nexCallout';



export default class animals extends LightningElement {
  @track characters = [];
  @api name;
  @api next;
  @track currentPage;
  @track ready;


  connectedCallback(){
    this.isLoaded
    makeGetCallout()
    .then(response =>{
      var characters = response.results;
        console.log('response', this.characters)
        this.currentPage = 1; 
        this.filterCharacters(characters)
        !this.isLoaded;
    })  

    setTimeout(() => {
      this.ready = true;
  }, 3000);
 }

/*  toggle() {
  this.isLoaded = !this.isLoaded;
} */
  filterCharacters(characters){
  this.characters = [];
    for (let i = 0; i < 19; i++) {
      this.characters.push(characters[i]);
        console.log('Lista Pjs',this.characters);
      }
  }
      
  handleClick(){
    this.currentPage++;
    nextCallouts({currentPage: this.currentPage})
    .then(response =>{
      console.log('Index '+this.currentPage);
      var characters = response.results;
      this.filterCharacters(characters)
      console.log('response', this.characters)
      
  })
  }

  handleClickPrev(){
if (this.currentPage > 1) {
  console.log('clicando');
  this.currentPage--;
  nextCallouts({currentPage: this.currentPage})
  .then(response =>{
    console.log('Index '+this.currentPage);
    var characters = response.results;
    this.filterCharacters(characters)
    console.log('response', this.characters)
    
})
}

  }

  searchKeyword(event) {
    this.searchValue = event.target.value;
}



}