Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70817C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:08:13 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.1054.1746803288194285278
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 May 2025 08:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DrKWjXy+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.53, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6060200710bso1086432eaf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 09 May 2025 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1746803287; x=1747408087; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YffPrx8mZT7f7dTab2Fbxo1bvwCj4K86YNZ/jK4hl/Y=;
        b=DrKWjXy+WYMLggWuzhQvgOct2A1noPAo4bEgEcvnlxfQJf4XYh9UQB4WMUd485ibuO
         r4MFnfjNpuEB8pEyoDTa58PHsGvxxYdcTP959FuRN24UivjpeULMJa4EECUPc2yokcGj
         0EiKHVHrfA0M0fRYtX3lJl1EKjPboXqbAKYxIfaAJDAzEIJQcnMoSxwjBWvJUOFMIoaY
         QGC3iJnStPC5AlWsZAynCl4PiSQWByZnbBRlBl2s4O5gmvwyuoD2fS4aQF5GrgMlhfFl
         XufqRXDZvHcTascCLbddKCx9L8sWkKdooOTVxXIWdVcgskKJ/6m44QN5cU5hrbQuhkT1
         /aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803287; x=1747408087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YffPrx8mZT7f7dTab2Fbxo1bvwCj4K86YNZ/jK4hl/Y=;
        b=wUbbGV/kAY5FbJGO4+RaMS+I5EU86o2W0hasWRGPnC/5NKQ+JTkAtD+mZQmHenZ6e+
         YP0PbPRUi1RWw/DGQmvUz8fsXHJnVyNchDRYAWA5RwdNy1/53tJmhM5U919hPdZ3VXVB
         Pnguci7qqMLDOTJMwARzn0htpQOxxphyE3reJ+7utyG6Rus3VF7lwviU0TefOSE1I+/9
         PeDZy/4r7JNXT9dIiBnxWImqV8rkWDe7dp25bVVmqwp1PLiosECOOsd1kUwL/7QlBkRJ
         wbeUSZX0+STzGSbJY5DhhnisPfyH+32FNPredtnChnS3vZ2TCMwjWfTBWDv0TCOgvLHq
         9ksw==
X-Gm-Message-State: AOJu0YxrFT6fDSeNEP1TOWgs5tOd7QpxMsCh4hlRlyUI6x9QOksRcoJT
	0pMDH64hlsi99bs99jyk1g5nJJjqQYrqpxYCKQDqHE75pdA6Z6CngKfnZm0lvUYE72y/H3lxkz9
	LNkTbCf/yFcadb/UlByhQY4L8bLor+YDg72lm
X-Gm-Gg: ASbGncvII6m8/dldU8JFUiXJVXVP5D00QkHgoQ9LRek9BUPM911wtqsdLQiqxTxK7aJ
	rrNoj9OLkd0eYpC//AvIYPoPuGLT8wiorWd/gFMW/vgo2qEDWm8nDlGgXydbiuLc/K3gppnAYvv
	DCeBWod0U9Z9RopRMAZFBRCQ==
X-Google-Smtp-Source: AGHT+IFU7wucc5pImkCR9udexf62cFOHRHktGI0yvVjZwpmjOpiRSZFn0h+/BZCpst4JIsVMUD1ZDJtQPIcSx6XW9Fc=
X-Received: by 2002:a05:6820:4d06:b0:608:3f1d:bbdb with SMTP id
 006d021491bc7-6084c1205b1mr2181015eaf.8.1746803287236; Fri, 09 May 2025
 08:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250507173921.754-1-ali.oezaslan@arm.com> <20250507173921.754-2-ali.oezaslan@arm.com>
In-Reply-To: <20250507173921.754-2-ali.oezaslan@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 9 May 2025 11:07:55 -0400
X-Gm-Features: ATxdqUHteIApKBsEOuOE_7unJ770_f3ERco3kbyjLTpQqKtRw1a8zGlNZw0LO0U
Message-ID: <CAPoiz9yXvLiVOGFD55-k+jCvU3X1rKwDrvG8S50GxA2BzGX_Cg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH walnascar 1/1] arm-bsp/trusted-services:
 corstone1000: Align PSA crypto structs with TF-M
To: ali.oezaslan@arm.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 May 2025 15:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6496

Hello Ali,
I have a couple of issues with this patch.  Firstly, this is for the
walnascar branch, but it hasn't been pushed to master first.  It needs
to be in master first.  See
https://git.yoctoproject.org/meta-arm/tree/documentation/releases.md#n12

Secondly, the patch status is "Pending", and there is no follow-on
(e.g., no "[comment]" following the Pending).  Pending has been abused
in the past and we're trying very hard to only allow Pending in
extreme circumstances, and then it should include a pointer to an open
issue on the relevant project's github/gitlab/mailing list.  See
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#pat=
ch-upstream-status
for more information on the upstream status.

Thanks,
Jon


On Wed, May 7, 2025 at 1:39=E2=80=AFPM ali.oezaslan via lists.yoctoproject.=
org
<ali.oezaslan=3Darm.com@lists.yoctoproject.org> wrote:
>
> From: Ali Can Ozaslan <ali.oezaslan@arm.com>
>
> The TF-M was upgraded to v2.1.1 for the Corstone-1000. The TS had to be
> aligned with it, to keep the Secure Enclave Proxy Secure Partition
> compatible with TF-M.
>
> Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
> ---
>  ...n-PSA-Crypto-structs-with-TF-Mv2.1.1.patch | 29 +++++++++++++++++++
>  .../trusted-services/ts-arm-platforms.inc     |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
>
> diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch b/meta-arm-bsp/recipes-=
security/trusted-services/corstone1000/0021-Align-PSA-Crypto-structs-with-T=
F-Mv2.1.1.patch
> new file mode 100644
> index 00000000..352fe9ea
> --- /dev/null
> +++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-Al=
ign-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
> @@ -0,0 +1,29 @@
> +From 71da6c0384fb241cadf052968e8dce9c357e4a33 Mon Sep 17 00:00:00 2001
> +From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> +Date: Tue, 29 Apr 2025 07:52:14 +0000
> +Subject: [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
> +
> +The psa_client_key_attributes_s struct had to be aligned with the
> +psa_key_attributes_s struct in TF-M.
> +
> +Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
> +Upstream-Status: Pending
> +---
> + components/service/crypto/include/psa/crypto_client_struct.h | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/components/service/crypto/include/psa/crypto_client_struct.=
h b/components/service/crypto/include/psa/crypto_client_struct.h
> +index ebc4008..f0c8cad 100644
> +--- a/components/service/crypto/include/psa/crypto_client_struct.h
> ++++ b/components/service/crypto/include/psa/crypto_client_struct.h
> +@@ -38,7 +38,6 @@ struct psa_client_key_attributes_s
> +     uint32_t alg;
> +     uint32_t alg2;
> +     uint32_t id;
> +-    int32_t owner_id;
> + };
> +
> + #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
> +--
> +2.34.1
> +
> diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.i=
nc
> index 770c47ab..84f4c07f 100644
> --- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
> +++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
> @@ -22,6 +22,7 @@ SRC_URI:append:corstone1000  =3D " \
>      file://0018-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
>      file://0019-Align-PSA-Crypto-with-TF-Mv2.1.patch \
>      file://0020-se-proxy-protobuf-change.patch \
> +    file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
>      "
>
>  # The patches above introduce errors with GCC 14.1, silence them for now
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6495): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6495
> Mute This Topic: https://lists.yoctoproject.org/mt/112672802/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

