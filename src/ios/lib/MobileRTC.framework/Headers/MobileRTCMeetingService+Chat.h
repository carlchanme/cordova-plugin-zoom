//
//  MobileRTCMeetingService+Chat.h
//  MobileRTC
//
//  Created by Chao Bai on 2018/6/6.
//  Copyright © 2019 Zoom Video Communications, Inc. All rights reserved.
//

#import <MobileRTC/MobileRTC.h>

typedef enum {
    ///All the members in the group. 
    MobileRTCChatGroup_All                   = 0,
    ///Panelists.
    MobileRTCChatGroup_Panelists              = 1,
}MobileRTCChatGroup;

@interface MobileRTCMeetingService (Chat)

/*!
 @brief Query if the chat is disabled in the meeting.
 @return YES means disabled, otherwise not. 
 */
- (BOOL)isChatDisabled;

/*!
 @brief Query if it is able to send private chat in the meeting. 
 @return YES means disabled, otherwise not.
 */
- (BOOL)isPrivateChatDisabled;

/*!
 @brief Get in-meeting chat message. 
 @param messageID The ID of the message sent in the meeting.
 @return The instance of in-meeting chat.
 @warning The method is optional.
 */
- (nullable MobileRTCMeetingChat*)meetingChatByID:(nonnull NSString*)messageID;

/*!
 @brief Send chat message to the specified user in the meeting.
 @param userID The ID of user who receives message in the meeting.
 @param content The message to be sent.
 @return The result of sending the message.
 */
- (MobileRTCSendChatError)sendChatToUser:(NSUInteger)userID WithContent:(nonnull NSString*)content;

/*!
 @brief Send message to group in the meeting.
 @param group Group type in the meeting, see MobileRTCChatGroup.
 @param content The message to be sent.
 @return The result of sending the message.
 */
- (MobileRTCSendChatError)sendChatToGroup:(MobileRTCChatGroup)group WithContent:(nonnull NSString*)content;

@end
