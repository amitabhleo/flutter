const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();


// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions

 exports.helloWorld = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
 });

//on delete create log
//exports.userDelete = functions.auth.user().onDelete((user)=>{
//console.log('user deleted $user.uid')
//});
    //TODO working code do not change
  exports.sendNotification = functions.firestore
 .document('orders/{orderId}')
 .onCreate((snap, context) => {
 const fcm = admin.messaging();
 //const increment = firebase.firestore.FieldValue.increment(1);
           // Get an object representing the document
           const newValue = snap.data();
           //let orderRecId = snap.documentID;
           console.log(snap.data().name);
           const name = snap.data().name;


           //const payload: admin.messaging.MessagingPayload ={
           const     payload = {
           notification: {
           title: 'first Notification',
           body: 'notification is ready',
           icon: 'default'
           }
           };
           const mytoken = 'dMSE2HEzRVm5aJFabJ2_Cy:APA91bEYoFeh71rvl256eXSOb7ybHVO1jCbgS5SyPBiTSl_SP_HaX9N4mRiZ4zkOV1AQO2PYct8oxfCl-m_RFROmo7shGXSGbDDTfBX8ZCrDoOuqy1XEW5hxwmsepMhygtXCu7wI4PLP';
           const mytoken1 = 'eQqlNLDYQXe1ZaDBvJgMbp:APA91bHBRuaqfkBKdPsMnZ598MF1QpSrsptiq4RLPQ_Ssfb4ejpVkgf-M1FIaGCRqbua-Q7FQDDOVw6gMwUg3fN4CybsxDJvkXpXQ1w9a5iTAXk0FaBaNmwyPDnWcn97Q-HcpfyV9TPP';
          return admin.messaging().sendToDevice(mytoken1,payload);

         //fcm.sendNotification('myNotification',payload);
         //fcm.sendNotification('name',payload);
                 // return admin.firestore().collection('dailyOrders').doc().set({name: snap.data().name });
 });

 exports.addToChainCount = functions.firestore
     .document('/chains/{id}')
     .onCreate((snap, context) => {
            console.log(snap.data());
             console.log(snap.data().count);

        const db = admin.firestore();

       const docRef = db.collection('chains').doc(context.params.id);
       //return docRef.set({count:admin.firestore.FieldValue.increment(1)},{merge: true});
        return admin.firestore().collection('counters').doc('orderNumbers').set({count: admin.firestore.FieldValue.increment(5)},{merge: true});
       });

     // Initialize document
     //var chainCounterRef = db.collection('counters').doc('chains');
//    const newValue = snap.data();
//        const db = admin.firestore();
//     var chainCounterRef = db.collection('chains').doc(snap.data().count);
//     chainCounterRef.update({ count: FieldValue.increment(1) });
//console.log('chainCounterRef :',chainCounterRef);
//    var firestore = admin.firestore();
//    var docRef = firestore.collection('your_collection').doc('your_document');
//    docRef.update({ itemCount: admin.firestore.FieldValue.increment(1) })
//         return true;

      // return admin.firestore().collection('counters').doc().create({count: admin.firestore.FieldValue.increment(5)});
        //count.FieldValue.increment(1) });
     //snap.data().name });
 //});