import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Color(0xFF565656),
        ),
        centerTitle: true,
        title: Text(
          'Terms & Conditions',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: const Color(0xFF565656),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(children: [
            Text(
              'The Lorem ipsum text is derived from sections 1.10.32 and 1.10.33 of Cicero\'s De finibus bonorum et malorum.[7][8] The physical source may have been the 1914 Loeb Classical Library edition of De finibus, where the Latin text, presented on the left-hand (even) pages, breaks off on page 34 with "Neque porro quisquam est qui do-" and continues on page 36 with "lorem ipsum ...", suggesting that the galley type of that page was mixed up to make the dummy text seen today.[1]The discovery of the texs origin is attributed to Richard McClintock, a Latin scholar at HampdenSydney College. McClintock connected Lorem ipsum to Ciceros writing sometime before 1982 while searching for instances of the Latin word consectetur, which was rarely used in classical literature.[2] McClintock first published his discovery in a 1994 letter to the editor of Before & After magazine,[9] contesting the editors earlier claim that Lorem ipsum held no meaning.[2]The relevant section of Cicero as printed in the source is reproduced below with fragments used in Lorem ipsum highlighted. Letters in brackets were added to Lorem ipsum and were not present in the source text:[32] Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum[d] exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? [D]Quis autem vel eum i[r]ure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?[33] At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem reru[d]um facilis est e[r]t expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellend[a]us. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.What follows is H. Rackhams translation, as printed in the 1914 Loeb edition, with words at least partially represented in Lorem ipsum highlighted:[8][32] But I must explain to you how all this mistaken idea of reprobating pleasure and extolling pain arose. To do so, I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?[33] On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.See alsoAsemic writing  Wordless open semantic form of writingEtaoin shrdlu  Common metal-type printing errorGibberish  Nonsensical languageHamburgevons  Text used as a sample for assessing fontsIndian-head test pattern  Television test cardLenna  Standard test imageLi Europan lingues  Placeholder text in InterlingueMetasyntactic variable  Placeholder term used in computer sciencePangram  Sentence using every letter of alphabetThe quick brown fox jumps over the lazy dog  Sentence containing all letters of the English alphabetShibboleth  Custom or tradition that distinguishes one group from another"To come"  Phrase used in publishing to indicate missing materialUtah teapot  Computer graphics 3D reference and test modelReferences Cibois, Philippe (2012-06-03). "Lorem ipsum: nouvel état de la question". Lintelligence du monde. LInstitut français. Retrieved 2017-04-07. Adams, Cecil (February 2001). "What does the filler text lorem ipsum mean". The Straight Dope. Retrieved 3 June 2022. LaTeX lipsum package. Retrieved 23 September 2017. "LaTeX blind text package". Retrieved 23 September 2017. "How to insert sample text into a document in Word". Microsoft Support. 18 September 2011. Archived from the original on 12 January 2012. Retrieved 14 November 2011. "Best Lorem Ipsum Generator". loremgenerator.io. Retrieved 2021-03-14. "Description of the "Lorem ipsum dolor sit amet" text that appears in Word Help". support.microsoft.com. Retrieved 2007-03-22. Cicero, Marcus Tullius; Rackham, H. (1914). De finibus bonorum et malorum (in Latin and English). New York: Macmillan Co. p. 36 (Book I ix 32). Before & After 4:2, according to Norman Walsh. "Frequently Asked Questions About Fonts". Retrieved 2023-05-12.External linksLorem ipsumat Wikipedias sister projectsDefinitions from WiktionaryMedia from CommonsTexts from WikisourceThe original De finibus bonorum et malorum (Book 1) from Cicero, on Latin WikiSource',
              style: GoogleFonts.lato(
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: const Color.fromRGBO(86, 86, 86, 0.9)),
            )
          ]),
        ),
      ),
    );
  }
}