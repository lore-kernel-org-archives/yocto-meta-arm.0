Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4A2C369DC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 07:17:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2731.1746602236928522736
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 May 2025 00:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C92C140CC0;
	Wed,  7 May 2025 07:17:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HOsjYvVfsxoB; Wed,  7 May 2025 07:17:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 99ED840BD4;
	Wed,  7 May 2025 07:17:13 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0A602167974; Wed,  7 May 2025 03:17:13 -0400 (EDT)
Date: Wed, 7 May 2025 03:17:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-arm] [PATCH] optee-test: Suppress new gcc-15
 -Wunterminated-string-initialization
Message-ID: <20250507071713.GK18383@denix.org>
References: <20250507014107.1686356-1-denis@denix.org>
 <aBr-XXXtYacQM1yy@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBr-XXXtYacQM1yy@nuoska>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 May 2025 07:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6492

On Wed, May 07, 2025 at 09:31:57AM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Tue, May 06, 2025 at 09:41:07PM -0400, Denys Dmytriyenko via lists.yoctoproject.org wrote:
> > From: Denys Dmytriyenko <denys@konsulko.com>
> > 
> > Mark corresponding arrays with nonstring attribute to suppress the new
> > gcc-15 warning -Wunterminated-string-initialization that becomes an
> > error due to the global -Werror.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > ---
> >  ...-15-Wunterminated-string-initializat.patch | 69 +++++++++++++++++++
> >  .../optee/optee-test_4.4.0.bb                 |  1 +
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch b/meta-arm/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch
> > new file mode 100644
> > index 00000000..0f52f3d6
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-test/0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch
> > @@ -0,0 +1,69 @@
> > +From a8e58203dcb4c13ee340259cd2692202ac8414d1 Mon Sep 17 00:00:00 2001
> > +From: Denys Dmytriyenko <denys@konsulko.com>
> > +Date: Tue, 6 May 2025 21:35:55 -0400
> > +Subject: [PATCH] Suppress new gcc-15 -Wunterminated-string-initialization
> > +
> > +GCC 15 now warns when character arrays are being initialized by strings
> > +and terminating NUL character doesn't fit. GCC 15.1 also allows marking
> > +such arrays with nonstring attribute to suppress the warning. W/o such
> > +attribute, the warning becomes error due to the global -Werror. Add the
> > +attribute accordingly.
> > +
> > +Fixes these errors:
> > +
> > +| ./regression_4000_data.h:7919:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (20 chars into 19 available) [-Werror=unterminated-string-initialization]
> > +|  7919 |         "encryption standard";
> > +|       |         ^~~~~~~~~~~~~~~~~~~~~
> > +| ./regression_4000_data.h:8387:9: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (113 chars into 112 available) [-Werror=unterminated-string-initialization]
> > +|  8387 |         "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomn"
> > +|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +| ./regression_4000.c:1295:47: error: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (4 chars into 3 available) [-Werror=unterminated-string-initialization]
> > +|  1295 | static const uint8_t hash_data_sm3_a1_in[3] = "abc";
> > +|       |                                               ^~~~~
> > +
> > +Upstream-Status: Pending
> 
> Thanks, this is the correct fix. Can you submit upstream? They react
> pretty fast there.

Already did.

Upstream-Status: Submitted [https://github.com/OP-TEE/optee_test/pull/796]


> I still don't like -Werror as default since compiler and versions
> at distro/intregrator level may differ greatly from what upstream
> uses and supports.
> 
> Cheers,
> 
> -Mikko
> 
> > +Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> > +---
> > + host/xtest/regression_4000.c      | 2 +-
> > + host/xtest/regression_4000_data.h | 4 ++--
> > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/host/xtest/regression_4000.c b/host/xtest/regression_4000.c
> > +index 3aa15be..46e6f8e 100644
> > +--- a/host/xtest/regression_4000.c
> > ++++ b/host/xtest/regression_4000.c
> > +@@ -1292,7 +1292,7 @@ static const uint8_t hash_data_shake256_out2[] = {
> > +  * https://tools.ietf.org/html/draft-sca-cfrg-sm3-02
> > +  * Appendix A.1
> > +  */
> > +-static const uint8_t hash_data_sm3_a1_in[3] = "abc";
> > ++static const uint8_t hash_data_sm3_a1_in[3] __attribute__((nonstring)) = "abc";
> > + 
> > + static const uint8_t hash_data_sm3_a1_out[] = {
> > + 	0x66, 0xc7, 0xf0, 0xf4, 0x62, 0xee, 0xed, 0xd9,
> > +diff --git a/host/xtest/regression_4000_data.h b/host/xtest/regression_4000_data.h
> > +index 0881ac3..eb101b2 100644
> > +--- a/host/xtest/regression_4000_data.h
> > ++++ b/host/xtest/regression_4000_data.h
> > +@@ -7914,7 +7914,7 @@ static struct derive_key_ecdh_t {
> > + };
> > + 
> > + /* G/MT 0003 (SM2) Part 5 Annex C.2 - encryption/decryption */
> > +-static const uint8_t gmt_0003_part5_c2_sm2_testvector_ptx[19] =
> > ++static const uint8_t gmt_0003_part5_c2_sm2_testvector_ptx[19] __attribute__((nonstring)) =
> > + /* M */
> > + 	"encryption standard";
> > + static const uint8_t gmt_0003_part5_c2_sm2_testvector_private[] = {
> > +@@ -8383,7 +8383,7 @@ static const uint8_t mac_data_sha3_512_out1[] = {
> > +  * GM/T 0042-2015
> > +  * Section D.3 Test vector 1
> > +  */
> > +-static const uint8_t mac_data_sm3_d31_in[112] =
> > ++static const uint8_t mac_data_sm3_d31_in[112] __attribute__((nonstring)) =
> > + 	"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomn"
> > + 	"opnopqabcdbcdecdefdefgefghfghighijhijkijkljklmklmn"
> > + 	"lmnomnopnopq";
> > +-- 
> > +2.25.1
> > +
> > diff --git a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb b/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
> > index d514c82c..80df523d 100644
> > --- a/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
> > +++ b/meta-arm/recipes-security/optee/optee-test_4.4.0.bb
> > @@ -5,6 +5,7 @@ SRCREV = "695231ef8987866663a9ed5afd8f77d1bae3dc08"
> >  
> >  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
> >  
> > +SRC_URI += "file://0001-Suppress-new-gcc-15-Wunterminated-string-initializat.patch"
> >  
> >  # Include ffa_spmc test group if the SPMC test is enabled.
> >  # Supported after op-tee v3.20
> > -- 
> > 2.25.1

