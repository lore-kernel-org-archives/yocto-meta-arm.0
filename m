Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07F8C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 16:05:47 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.93140.1740413146980156361
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 08:05:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=gKaE+iRy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.42, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5fcd7d306f3so3745820eaf.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 08:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1740413146; x=1741017946; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufkpOPScpLLBEFx691TP2aTLEMiyGHdo8Mu+mokXV8k=;
        b=gKaE+iRyAfGyzGlUNwaT+OBWjqne8eWIh6d9Zhc3uJ3Qud0MFXVLo3/WtkulV6f0Op
         aXnAvF3pb3vKlLfMAg/mg934g8VLaLGAO1oe4w9NrTID+76YH8qyI58zjZlHBtTT8N9U
         ovWWJUtwDfcJKA7pEglrS47QyZajq/lf2dZnRorJCgjrfhn+RfbbRUayahpgCWPP/eTf
         KAwKI1H7z7pmJHA2ZYpKpy3eWteDHVf8sd/EnLpzDhIe79QollAzssGA5MGvZVsP+Oe2
         HS3JcdhjY+GmfaFvLVWJ98NTAm0gGAONqCz3iDv5mrgEFdlOmgHRv9cKue/yP9HNghzZ
         V1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413146; x=1741017946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufkpOPScpLLBEFx691TP2aTLEMiyGHdo8Mu+mokXV8k=;
        b=wC+j267QeZPMotc4RCpMX56705UXVppX+SpFgEh8Cw/Kj8eBB37as5KTGjjyaE/8xB
         JzOzk6KJebnisUPZVBasM+Mf/5GFX5w0mXF7uE5nPqoejtGPY2AhrhY7Yx56MjXaaKb6
         qZ1NNPPu5l34IQKTe4xEku4U7cwePtmF926+AcmsRwAJD6/kDBcbr/K9ECHAmCr3kax7
         N/p1jr83E4Tuz78ddU+hwFzizoq50f31DZSizEF3lN2ZJAYOvWpYYYrOrkyUJ294K9FY
         wVhBfuGl+I77mUCmRf+YTx3isQ1FlU/aQNPOSRucRmxKTScDucreRU7GV5HyVvuOz+DI
         /pxQ==
X-Gm-Message-State: AOJu0YyNAoPRvzG/+ipA1qhnL+Mxk9bEoQmZw+cKdMUomCxQV7MvPWqE
	nz8TpszyQVqL14DJjflp2VHUFllvdhj0oW5wR8WbskI5wJrkgIbNVCfuOKNKDkBYrUXW1nHTSSC
	p0QWBeXdJFEBLahBDUdolWIfXrp7aBkjrrzEb
X-Gm-Gg: ASbGnctIiYCL/njhkMlrzQ8y07qf0TXh3Dbr981+x8Hb8ZXSRdmWDkFhqK9oStyd8j6
	ogEemiYdgcmMlFujPIZOmT6DVBroOuwtUTjlgqbVqLDpFuRW6H+mz2fuE2PuSzE5RT4X4m7v7Bz
	Hg4mc6PT4=
X-Google-Smtp-Source: AGHT+IG4JeU6z5qdzVgqSlx6z0iEZlEuodowb+vU5dEz4DzctZAwqYEBKttbnNBFFW5nRoE5nWa9Vx4r4QSHawbjgY4=
X-Received: by 2002:a05:6820:1612:b0:5fc:fb1a:2b92 with SMTP id
 006d021491bc7-5fd1968a430mr9111523eaf.6.1740413146024; Mon, 24 Feb 2025
 08:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20250224145112.71746-1-jon.mason@arm.com> <20250224145112.71746-3-jon.mason@arm.com>
In-Reply-To: <20250224145112.71746-3-jon.mason@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 24 Feb 2025 11:05:34 -0500
X-Gm-Features: AWEUYZl5PZp42FUFD37yIMTBBKi3KsKuLQ6ViMnnkBCu4x5kmpUZS0kh6Tlc6Mg
Message-ID: <CAPoiz9yLpME0Xse9UCWCuBiSKgTtjqZ-a21v+k=Jd4U+hHe9dw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 3/3] arm/fvp-base-a-aem: update to 11.28.23
To: jon.mason@arm.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Feb 2025 16:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6382

This series should've only contained this patch.  Please disregard the
previous 2 (as they've already been accepted)

On Mon, Feb 24, 2025 at 9:51=E2=80=AFAM Jon Mason via lists.yoctoproject.or=
g
<jon.mason=3Darm.com@lists.yoctoproject.org> wrote:
>
> Update to the latest version.
>
> License SHA changed due to the addition of "Artistic License 2.0" and
> was missing entries for a few others that were there previously.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  ...-base-a-aem_11.27.19.bb =3D> fvp-base-a-aem_11.28.23.bb} | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>  rename meta-arm/recipes-devtools/fvp/{fvp-base-a-aem_11.27.19.bb =3D> fv=
p-base-a-aem_11.28.23.bb} (71%)
>
> diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
> similarity index 71%
> rename from meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb
> rename to meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
> index dc9086c9529e..8c7e4dc668eb 100644
> --- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.27.19.bb
> +++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb
> @@ -1,14 +1,16 @@
>  require fvp-envelope.inc
>
> +LICENSE:append =3D " & Artistic-2.0 & BSL-1.0 & BSD-2-Clause & Unlicense=
"
> +
>  SUMMARY =3D "Arm Fixed Virtual Platform - Armv-A Base RevC Architecture =
Envelope Model FVP"
>  LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
> -                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Da3ce84371977a6b9c624408238309a90 \
> +                    file://license_terms/third_party_licenses/third_part=
y_licenses.txt;md5=3Dc51b57b6a4731881849eb0e2e2b6d799 \
>                      file://license_terms/third_party_licenses/arm_licens=
e_management_utilities/third_party_licenses.txt;md5=3Dabcaafefc7b7a0cdf6664=
c51f9075c5b"
>
>
>  SRC_URI =3D "https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Ar=
chitecture/${PV_URL_SHORT}/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=
=3D${BP};name=3Dfvp-${HOST_ARCH}"
> -SRC_URI[fvp-aarch64.sha256sum] =3D "66c9939cb2b2104e415dcddb46a2ab52168e=
8a2b7f30a339e1c05d5d4864ed1d"
> -SRC_URI[fvp-x86_64.sha256sum] =3D "cd70946a6b632950dca5def33d7656991a298=
27fa2f6f72f75011d85bdcee248"
> +SRC_URI[fvp-aarch64.sha256sum] =3D "a380e271f14ce7cf99158018368ac86fe8c3=
05f82c7d332a93eb08bf7a172571"
> +SRC_URI[fvp-x86_64.sha256sum] =3D "0f6d67d834a8ed5dff3c863e0e3545ef39c73=
6405ea8227577ac004cffd66e93"
>
>  # The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
>  UPSTREAM_VERSION_UNKNOWN =3D "1"
> --
> 2.39.5 (Apple Git-154)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6381): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6381
> Mute This Topic: https://lists.yoctoproject.org/mt/111358401/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

