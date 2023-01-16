import * as functions from "firebase-functions";
import admin from "firebase-admin";

// Start writing functions
// https://firebase.google.com/docs/functions/typescript

admin.initializeApp();
export const message = functions.region("asia-southeast2")
    .https.onCall(async (data) => {
      await admin.messaging().send({
        notification: {
          title: data.title,
          body: data.body,
        },
        token: data.fcm,
      });
      return {status: "ok"};
    });
