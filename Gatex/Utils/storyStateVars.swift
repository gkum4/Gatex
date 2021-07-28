//
//  publicVars.swift
//  Gatex
//
//  Created by Gustavo Kumasawa on 23/07/21.
//

import Foundation

public struct StoryState {
  var anger = 0
  var affection = 0
  var suspicion = 0
  var step = 0
  var optionChosen = 0
}

public var storyState = StoryState()

public enum OptionConsequenceTypes {
  case anger
  case affection
  case suspicion
  case end
}

public struct SituationData {
  var situationText: String
  
  var option1Description: String
  var option1ConsequenceType: OptionConsequenceTypes
  var option1ConsequenceText: String
  
  var option2Description: String
  var option2ConsequenceType: OptionConsequenceTypes
  var option2ConsequenceText: String
  var option2Hidden = false
  
  var option3Description: String
  var option3ConsequenceType: OptionConsequenceTypes
  var option3ConsequenceText: String
  var option3Hidden = false
}

public var wakeUpSituationData = SituationData(
  situationText: "São 4 horas da manhã e você acordou com fome...",
  option1Description: "Acordar humano",
  option1ConsequenceType: .affection,
  option1ConsequenceText: "Humano acorda bravo, mas lhe fornece alimento e você fica satisfeito.",
  option2Description: "Cozinhar um macarrão",
  option2ConsequenceType: .end,
  option2ConsequenceText: "O macarrão ficou delicioso, mas o humano descobriu em flagrante que você não era um gato comum. Infelizmente será necessário eliminar o humano e começar de novo...",
  option3Description: "Pedir comida por aplicativo",
  option3ConsequenceType: .suspicion,
  option3ConsequenceText: "A comida chega e você elimina o entregador. No entanto, o humano encontra a embalagem do alimento no lixo e acha um pouco estranho."
)

public var birdSituationData = SituationData(
  situationText: "Você está entendiado até que olha pela janela e encontra um pássaro no jardim...",
  option1Description: "Pegar a presa e levá-la ao seu humano como gesto de respeito",
  option1ConsequenceType: .anger,
  option1ConsequenceText: "O humano descarta seu presente e volta para o que estava fazendo. Você fica desapontado.",
  option2Description: "Eliminar o inimigo com tecnologias da Gatex",
  option2ConsequenceType: .suspicion,
  option2ConsequenceText: "O pássaro é carbonizado. O humano sente o cheiro de queimado e acha um pouco estranho.",
  option3Description: "Vomitar bola de pelo",
  option3ConsequenceType: .affection,
  option3ConsequenceText: "O humano acha um pouco nojento, mas limpa o seu vômito."
)

public var playSituationData = SituationData(
  situationText: "O humano quer brincar com você...",
  option1Description: "Interagir com o humano",
  option1ConsequenceType: .affection,
  option1ConsequenceText: "Você recebeu muitos carinhos, foi bom.",
  option2Description: "Morder",
  option2ConsequenceType: .anger,
  option2ConsequenceText: "O humano gritou com você.",
  option3Description: "Ir para reunião da Gatex e deixar humano brincando sozinho",
  option3ConsequenceType: .suspicion,
  option3ConsequenceText: "O humano não te encontrou e ficou preocupado. Ao ir até sua cama, encontra ítens da Gatex e percebe que você não é um gato comum."
)

public var vetSituationData = SituationData(
  situationText: "O humano leva você ao veterinário para tomar vacina, a situação não parece ser confortável...",
  option1Description: "Aniquilar a todos do verinário, os humanos devem ser eliminados ☠️☠️☠️",
  option1ConsequenceType: .end,
  option1ConsequenceText: "Você destruiu o espaço do veterinário e escapou. Está na hora de começar de novo...",
  option2Description: "Receber a vacina tranquilamente, seu humano está do seu lado, vai ficar tudo bem ❤️‍🩹",
  option2ConsequenceType: .end,
  option2ConsequenceText: "Você se demite da Gatex para viver em paz com seu humano, vocês se amam muito.\n\n😻",
  option3Description: "",
  option3ConsequenceType: .end,
  option3ConsequenceText: "",
  option3Hidden: true
)

public var humanKnowsSituationData = SituationData(
  situationText: "Ao ver o humano e perceber que ele sabe de seu segredo, você...",
  option1Description: "Elimina seu humano, não há mais volta",
  option1ConsequenceType: .end,
  option1ConsequenceText: "Está na hora de começar de novo...",
  option2Description: "Trai a Gatex e explica tudo para seu humano",
  option2ConsequenceType: .end,
  option2ConsequenceText: "Os superiores da Gatex ficam sabendo de sua traição e mandam apagar a sua memória e a de seu dono, foi como se esse dia nunca tivesse acontecido...",
  option3Description: "",
  option3ConsequenceType: .end,
  option3ConsequenceText: "",
  option3Hidden: true
)

public var storyBaseSequence = [
  wakeUpSituationData,
  birdSituationData,
  playSituationData,
  vetSituationData,
]
