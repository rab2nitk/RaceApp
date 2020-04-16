<aura:application implements="force:appHostable,flexipage:availableforAllPageTypes" >
    <ltng:require styles="/resource/SLDS100/assets/styles/salesforce-lightning-design-system.mins.css" />
    
    <div class="slds">
        <div clss = "slds-page-header">
            <p class ="slds-page-header__title" title="Race Tracker"> Race Tracker</p>
        </div>
        
        <div class="slds-m-around-small slds-p-top--large">
    	<c:NewRace/>    
        </div>
        
          <div class="slds-m-around-small slds-p-top--large">
    	<c:ListRaces/>  
        </div>
    
    
        </div>
    
</aura:application>