enum MessageType {
  text,
  image,
  video,
  audio,
  document,
  location,
  contact,
  sticker,
  gif,
  poll
}

enum MessageStatus {
  sending,
  sent,
  delivered,
  read
}

enum ChatType {
  individual,
  group,
  channel
}

enum CallType {
  voice,
  video
}

enum CallStatus {
  ringing,
  ongoing,
  ended,
  missed
}
