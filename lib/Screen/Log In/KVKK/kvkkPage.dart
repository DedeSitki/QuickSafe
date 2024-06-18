import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:quicksafe_project/Screen/Log%20In/SignIn/sign_up.dart';
import '../../../constant/constant.dart';
import '../../../ext/button.dart';

class KVKKPage extends StatefulWidget {
  const KVKKPage({super.key});

  @override
  State<KVKKPage> createState() => _KVKKPageState();
}

class _KVKKPageState extends State<KVKKPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrivacyPolicyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.grey300,
      appBar: AppBar(
        title: const Text('KVKK Bildirimi'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kişisel Verilerin Korunması Kanunu (KVKK) Bildirimi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bu mobil uygulama, kişisel verilerinizi korumak ve gizliliğinizi sağlamak amacıyla KVKK hükümlerine uygun olarak çalışmaktadır. Aşağıda, kişisel verilerinizin nasıl toplandığı, kullanıldığı, saklandığı ve paylaşıldığı hakkında bilgi bulabilirsiniz.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Toplanan Kişisel Veriler:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Uygulamayı kullanırken, aşağıdaki kişisel veriler toplanabilir:",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  "*Adınız, soyadınız, ve iletişim bilgileriniz (e-posta adresi, telefon numarası vb.)\n"
                  "*Coğrafi konum bilgileri (isteğe bağlı olarak, konum tabanlı hizmetlerin kullanımı için)\n"
                  "*Kullanıcı tercihleri ve alışveriş geçmişi gibi kullanıcı etkileşim verileri",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Kişisel Veri Kullanımı:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Toplanan kişisel veriler, aşağıdaki amaçlarla kullanılabilir:",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  "*Hesap oluşturma, işlem gerçekleştirme ve siparişlerinizi tamamlama.)\n"
                  "*Size özel teklifler ve kampanyalar sunma\n"
                  "*Ürünler ve hizmetler hakkında size bilgi verme\n"
                  "*Uygulama deneyimini iyileştirme ve kişiselleştirme",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Kişisel Veri Paylaşımı:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Kişisel verileriniz, yasal düzenlemelere uygun olarak ve sadece belirtilen amaçlar için üçüncü taraflarla paylaşılabilir. Bu paylaşımlar, işbirliği yapılan hizmet sağlayıcıları veya yasal gereklilikler çerçevesinde olabilir.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Kişisel Veri Güvenliği:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Kişisel verilerinizi korumak için gerekli teknik ve organizasyonel önlemleri almaktayız. Veri güvenliği amacıyla uygun şifreleme yöntemleri ve erişim kontrolleri gibi önlemler alınmaktadır.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                const Text(
                  'KVKK Hakları:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "KVKK kapsamında size tanınan haklar dahilinde, kişisel verilerinizin işlenmesi ile ilgili olarak bilgi alma, veri düzeltilmesi, veri silinmesi ve veri aktarımı gibi haklara sahipsiniz. Bu hakları kullanmak için bize başvurabilirsiniz.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Bu bildirim, KVKK hükümlerine uygun olarak kişisel verilerinizi işlediğimizi ve koruduğumuzu belirtmektedir. Uygulamayı kullanarak bu şartları kabul etmiş olursunuz.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                ExtPageButton.PrimaryButton(
                    btnfunc, Constant.green500, "Okudum ve Onaylıyorum")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void btnfunc() {
    Grock.to(const SignUpScreen());
  }
}
