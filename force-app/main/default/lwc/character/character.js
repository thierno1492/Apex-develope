import { LightningElement, track } from 'lwc';
var div_person = document.getElementById('#person');
export default class GetMyIp extends LightningElement {
     @track myIp; 
    @track charactersList;
    @track name;
    @track next = 1/*  `https://rickandmortyapi.com/api/character/?page=${this.next} ` */
    @track pages;
    @track count;
    @track prev = null;
    
/* 
   getIP() {
       const calloutURI = 'https://api.ipify.org?format=json';
        fetch(calloutURI, {
            method: "GET"
        }).then((response) => response.json())
            .then(repos => {
                console.log(repos)
                this.myIp = repos.ip
                console.log(this.myIp);
            });
    } 
  */





/* 
     getCharacter() {
        const calloutURI = 'https://rickandmortyapi.com/api/character/';
         fetch(calloutURI, {
             method: "GET"
         }).then((response) => response.json())
             .then(responseJson => {
                 console.log(responseJson);
                 this.charactersList = responseJson.results;
                 this.pages = responseJson[0].pages;
                 
                  this.name = responseJson.results[0].name; 
                this.next = responseJson.info.pages;
                this.next.add(charactersList);
                console.log('thierno'+ next);
                nextHandler();

             })
 */


             heading = document.getElementById('heading');
 characters = document.getElementById('characters');
singleCharacter = document.getElementById('single-character');
// const modal = document.getElementById('modal');
 prev = document.getElementById('prev');
 next = document.getElementById('next');

 getCharacter(){
    const calloutURI = 'https://rickandmortyapi.com/api/character/';
    fetch(calloutURI
    .then(res => res.json())
    .then(data => {
        console.log(data);

        characters.innerHTML = data.results.map(item => `
        
            <div class = 'character'>
            
                <img src = '${item.image}' />

                <div class = 'character-info' data-characterID = '${item.id}'>
                
                    <h3>${item.name}</h3>
                
                </div>
            
            </div>
        
        `).join('');
    }));

// Get character by id
 getCharacterById = character => {
    fetch(`https://rickandmortyapi.com/api/character/${character}`)
        .then(res => res.json())
        .then(data => {
            addCharacterToDOM(data);
        });
}

// Adding characters to DOM
addCharacterToDOM = character => {

    singleCharacter.innerHTML = `
    
        <div class = 'modal' id = 'modal'>

            <div class = 'modal-container'>
            
                <img src = '${character.image}' />

                <div class = 'modal-container-info'>
                
                    <h3>Id: ${character.id}</h3>
                    <h3>Name: ${character.name}</h3>
                    <h3>Status: ${character.status}</h3>
                    <h3>Gender: ${character.gender}</h3>
                    <h3>Species: ${character.species}</h3>
                    <h3>Location: ${character.location.name}</h3>
                    <h3># of episodes: ${character.episode.length}</h3>
                
                </div>

            </div>

        </div>

    `;
}

// Show single character
characters.addEventListener('click', e => {

    const characterInfo = e.path.find(item => {
        if (item.classList) {
            return item.classList.contains('character-info');
        }
    });

    if (characterInfo) {
        const characterId = characterInfo.getAttribute('data-characterID');
        getCharacterById(characterId);
    }

});

// Close modal
window.addEventListener('click', e => {
    if (e.target === modal) {
        modal.style.display = 'none';
    }
});


// Next clicking
 counter = 1;
next.addEventListener('click', () => {

    fetch(`https://rickandmortyapi.com/api/character/?page=${++counter}`)
        .then(res => res.json())
        .then(data => {
            console.log(data);

            characters.innerHTML = data.results.map(item => `
            
                <div class = 'character'>
                
                    <img src = '${item.image}' />
    
                    <div class = 'character-info' data-characterID = '${item.id}'>
                    
                        <h3>${item.name}</h3>
                    
                    </div>
                
                </div>
            
            `).join('');
        });
});

// Prev clicking
prev.addEventListener('click', () => {

    fetch(`https://rickandmortyapi.com/api/character/?page=${--counter}`)
        .then(res => res.json())
        .then(data => {
            console.log(data);

            characters.innerHTML = data.results.map(item => `
            
                <div class = 'character'>
                
                    <img src = '${item.image}' />
    
                    <div class = 'character-info' data-characterID = '${item.id}'>
                    
                        <h3>${item.name}</h3>
                    
                    </div>
                
                </div>
            
            `).join('');
        });
});

        
     }



    
  nextHandler(){
        this.next = + 1;
    } 
 }

