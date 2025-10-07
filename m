Return-Path: <tanguy.raufflet@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92862CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:11:23 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.16965.1759839081677512274
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Oct 2025 05:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Uv6g5CIt;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 749CD3D80F49
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Oct 2025 08:11:20 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id a8_IyNfRmwPN for <meta-arm@lists.yoctoproject.org>;
 Tue,  7 Oct 2025 08:11:19 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 568DF3D8376F
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Oct 2025 08:11:19 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 568DF3D8376F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1759839079; bh=fDon7D2Nl8EYtDjNb68zu8226Mf3b+sR00v5V0srfZY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Uv6g5CItzLOLvqjTY/wv4mUdW/XlswqgRRK+aUfL/IesCEvEiasMB/u9gSpCRdQZ/
	 ig4XmKlbIDis/7jMm12ZuaMRvV298p594f/FzhsyP3Z+RgauhvZJNHDCKXdF/RkYl2
	 Eycj7hp26r7L51rj6Hy/cPPWMhvVefUdVbqWzA33ukl7iKyBG5bFWv7CpL9qSZO1yj
	 PwwrFJzLYbojd4gR+h+b3t7XJMqr7QOvUhga5hBsAfCEcuzsSqPD+0r1RhZQ+nM8zq
	 w03shz/kvROHRpr1jOh8hhA1jP4Fy4gT3puQJNgY+SmaJBsa5C+EivVP2L1ZR6aLww
	 zhxxsgPh1Lhbw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 2q85_if_i55f for <meta-arm@lists.yoctoproject.org>;
 Tue,  7 Oct 2025 08:11:19 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 215C73D80F49
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Oct 2025 08:11:19 -0400 (EDT)
Date: Tue, 7 Oct 2025 08:11:19 -0400 (EDT)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: meta-arm@lists.yoctoproject.org
Message-ID: <957048281.3165100.1759839079101.JavaMail.zimbra@savoirfairelinux.com>
Subject: Question regarding optee-ftpm TA recipe
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="=_eac1e492-81a4-4ae3-b541-76cfd02520f1"
X-Mailer: Zimbra 10.1.6_GA_0225 (ZimbraWebClient - FF143 (Linux)/10.1.6_GA_0225)
Thread-Index: XGAjnS9bHayRPmMX/jLyCF2pBSbUww==
Thread-Topic: Question regarding optee-ftpm TA recipe
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Oct 2025 12:11:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6726

--=_eac1e492-81a4-4ae3-b541-76cfd02520f1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello, 

I recently updated my BSP to a more recent version of Kirktone 
which leads me to use the new optee-ftpm_git recipe. This one is based 
on Microsoft/ms-tpm-20-ref while the older recipe was using MSRsec 
(changes introduced by [1]). 

After this change I could not boot my target anymore and had no 
meaningful errors. I finally figured out that one of the 4 
"Authentication passed" messages was missing compared to the secure-boot 
documentation from TI regarding the AM64x [2]. 
I manage to link this to a problem with the bl32.bin file, which is 
actually much smaller when using the new version of the optee-ftpm 
recipe (0.7MiB against 1.2MiB with the recipe using MSRsec). I solved my 
issue by reverting [1], but I would prefer not to do so since MSRsec 
looks to be not maintained anymore. 

When looking at the MSRsec repo, we can see it uses ms-tpm-20-ref as a 
submodule, so I wonder if we can really use ms-tpm-20-ref alone as is 
currently done. In addition, I saw that the recipe from the master 
branch has changed to introduce the new optee_ftpm from OP-TEE in 
addition to ms-tpm-20-ref. 

Do you know if the recipe from the Kirktone branch is applicable in my 
case (AM64) or if I absolutely need to backport the recipe from master 
to make the fTPM work? 

[1]: optee-ftpm: Use the latest fTPM sources 
commit: 3ee7d019898854f776f95ed31f4b7ea8c8a73dfe 
[2]: https://software-dl.ti.com/processor-sdk-linux/esd/AM64X/latest/exports/docs/linux/Foundational_Components_Secure_Boot.html#secure-boot-flow 


--=_eac1e492-81a4-4ae3-b541-76cfd02520f1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial,helvetica,sans-serif; font-siz=
e: 12pt; color: #000000"><div>Hello,</div><div><br data-mce-bogus=3D"1"></d=
iv><div>I recently updated my BSP to a more recent version of Kirktone<br>w=
hich leads me to use the new optee-ftpm_git recipe. This one is based<br>on=
 Microsoft/ms-tpm-20-ref while the older recipe was using MSRsec<br>(change=
s introduced by [1]).<br><br>After this change I could not boot my target a=
nymore and had no<br>meaningful errors. I finally figured out that one of t=
he 4<br>"Authentication passed" messages was missing compared to the secure=
-boot<br>documentation from TI regarding the AM64x [2].<br>I manage to link=
 this to a problem with the bl32.bin file, which is<br>actually much smalle=
r when using the new version of the optee-ftpm<br>recipe (0.7MiB against 1.=
2MiB with the recipe using MSRsec). I solved my<br>issue by reverting [1], =
but I would prefer not to do so since MSRsec<br>looks to be not maintained =
anymore.<br><br>When looking at the MSRsec repo, we can see it uses ms-tpm-=
20-ref as a<br>submodule, so I wonder if we can really use ms-tpm-20-ref al=
one as is<br>currently done. In addition, I saw that the recipe from the ma=
ster<br>branch has changed to introduce the new optee_ftpm from OP-TEE in<b=
r>addition to ms-tpm-20-ref.<br><br>Do you know if the recipe from the Kirk=
tone branch is applicable in my<br>case (AM64) or if I absolutely need to b=
ackport the recipe from master<br>to make the fTPM work?<br><br>[1]: optee-=
ftpm: Use the latest fTPM sources<br>&nbsp; &nbsp; commit: 3ee7d019898854f7=
76f95ed31f4b7ea8c8a73dfe<br>[2]: https://software-dl.ti.com/processor-sdk-l=
inux/esd/AM64X/latest/exports/docs/linux/Foundational_Components_Secure_Boo=
t.html#secure-boot-flow<br><br></div></div></body></html>
--=_eac1e492-81a4-4ae3-b541-76cfd02520f1--

