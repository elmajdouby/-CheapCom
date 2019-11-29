// window.rates = function(){
let index = 0;
let cptSuplement = 0;
// let gon.memberRate = 0;
// let gon.memberSuplementRate = 0;
// let gon.tennisRate = 0;
//**************************** Memebers *********************************
let arrayMember = [];
const inputMember = document.getElementById('member');
if (inputMember){
  if ($('member').value){
    arrayMember = $('member').value.split(",");
    arrayMember.forEach((recordMember) => {
      avatar = document.getElementById('photoPreview_' + arrayMember[index]);
      arrayMember[index] = Number.parseInt(recordMember, 10);
      if (avatar.dataset.memberLien === 'Enfant') {
        cptSuplement = cptSuplement + 1;
      }
      index = index + 1 ;
    });
  }
}


index = 0;
//*********************** Memebers supp *********************************
let arrayMemberSuplement  = [];
const inputMemberSuplement = document.getElementById('membersuplement');
if (inputMemberSuplement){
  if ($('membersuplement').value){
    arrayMemberSuplement = $('membersuplement').value.split(",");
    arrayMemberSuplement.forEach((recordMemberSuplement) => {
      arrayMemberSuplement[index] = Number.parseInt(recordMemberSuplement, 10);
      index = index + 1 ;
    });
  }
}

cptSuplement = cptSuplement + arrayMemberSuplement.length;

index = 0;
//**************************** Tennis **********************************
let arrayTennis = [];
const inputTennis = document.getElementById('tennis');
if (inputTennis){
  if ($('tennis').value){
    arrayTennis = $('tennis').value.split(",");
    arrayTennis.forEach((recordTennis) => {
      avatar = document.getElementById('photoPreview_' + arrayTennis[index]);
      avatar.insertAdjacentHTML('afterend', `<i id= "tennis_${arrayTennis[index]}" class="fas fa-table-tennis"; margin-left:10px;margin-top:10px;"></i>`);
      arrayTennis[index] = Number.parseInt(recordTennis, 10);
      index = index + 1 ;
    });
  }

}
// let arrayRate = [];

// }

function $(id) {
  return document.getElementById(id);
};

// window.myDragula = function () {
  dragula([$('drag-elements'), $('drop-target')]).on('drop',(el, target, source, sibling) => {
                                                  const avatar          = el.childNodes[1].childNodes[1].childNodes[1];
                                                  const dragZone        = avatar.closest('#drop-target');
                                                  const memberId        = avatar.getAttribute('data-member-id');
                                                  const memberLink      = avatar.getAttribute('data-member-lien');
                                                  const tennisId        =  'tennis_' + memberId;
                                                  const tennisFind      = document.getElementById(tennisId);
                                                  const memberIdInteger = Number.parseInt(memberId, 10);
                                                  console.log('memberSuplementRate');
                                                  if (dragZone) {
                                                    let RequesTennis = window.confirm("Tennis ?")
                                                    if (RequesTennis) {
                                                      avatar.insertAdjacentHTML('afterend', `<i id= ${tennisId} class="fas fa-table-tennis"; margin-left:10px;margin-top:10px;"></i>`);
                                                      arrayTennis.push(memberIdInteger);
                                                      if (tennis){
                                                        $('tennis').value = '';
                                                      }
                                                    }
                                                    arrayMember.push(memberIdInteger);
                                                    index = 0;

                                                    arrayMember.forEach((recordMember) => {
                                                      if ( memberIdInteger === recordMember && memberLink === 'Enfant') {
                                                        cptSuptelement = cptSuplement + 1;
                                                        if (cptSuplement > 3) {
                                                          arrayMemberSuplement.push(1);
                                                        }
                                                      }
                                                      index = index + 1;
                                                    });
                                                  }
                                                  else {
                                                    if (tennisFind) {
                                                      tennisFind.remove();
                                                    }
                                                    //*************** Members ****************
                                                    index = 0;
                                                    arrayMember.forEach((recordMember) => {
                                                      if ( memberIdInteger === recordMember) {
                                                        arrayMember.splice(index, 1);
                                                      }
                                                      index = index + 1;
                                                    });
                                                    //*********** MemberSuplement ************
                                                    if ( arrayMemberSuplement.length >= 1 ) {
                                                      cptSuplement = arrayMemberSuplement.length - 1;
                                                      arrayMemberSuplement.splice(cptSuplement, 1);
                                                    }
                                                    // //*************** Tennis *****************
                                                    index = 0;
                                                    arrayTennis.forEach((recordTennis) => {
                                                      if ( memberIdInteger === recordTennis) {
                                                        arrayTennis.splice(index, 1);
                                                      }
                                                      index = index + 1;
                                                    });
                                                  }
                                                  $('member').value = arrayMember;
                                                  $('membersuplement').value = arrayMemberSuplement;
                                                  $('tennis').value = arrayTennis;
                                                  //******************** Global Amount ***************
                                                  if (arrayMember.length === 0){
                                                    $('amount').value = 0;
                                                  }
                                                  else{
                                                    $('amount').value = Number.parseInt(gon.memberRate , 10) + (arrayMemberSuplement.length * Number.parseInt(gon.memberSuplementRate , 10) ) + (arrayTennis.length * Number.parseInt(gon.tennisRate , 10));
                                                  }
                                                  

                                                });



// }
