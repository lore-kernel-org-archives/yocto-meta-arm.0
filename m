Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1AEC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 12:23:27 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.13652.1676463803914533348
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 04:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kKB1S+dR;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id g8so19659703vso.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 04:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UuvqxEFAZh1do/rykYaY7dgQIyBI8OgrAzyieATHvSk=;
        b=kKB1S+dRz1FMRB0gFMgFSpBIDhuqEhSfSi0ZuzpgTDprD8hdPaAR/ngdI17LwZCIPn
         MjMGczsG2/eLPaDGgQgPV523dHTslGr6CeNHmYgKb8W3BDtkk3FWL02IeRWtYiLOizHd
         vlRzS/zYcC3ZPrcboqAPknDYsrGYj+45+BP57l20aDdaDmJ71+tGPMAX/3b/ITbYE1RM
         cV47Jf+KGU9wyJaRnKnE7Or96t1ue/opOUqkRPbjG8sK0gR3grB0fLrJeBhJKNmQOzpv
         MIeDzX9MtdxYY8OQos9GTmdP1+r8+3yC71anuTaJf65+9zRSmqw6PzEsds1jeVmmmKt5
         nm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuvqxEFAZh1do/rykYaY7dgQIyBI8OgrAzyieATHvSk=;
        b=ZAhlD04RCugWPF+GqhN0eWqN1ajFguyfHBAwcYcdA7GtXAA06lsILqAF//BM2o9+bz
         pA/qAR7p1QROyZnSWME6higwW1r3uDrRwi15jN4w24OyZY5K/u+jDh59X4ohgi2J8nzg
         hj1A4t0R68NAAQtRCHmZXjzR9TqSkJAJzYtjLHjuTWTPfBX2T/Pz7Z/VpUt/lyXg4qKi
         TwLwSaLpErkvNArUP8qaaUyKh7kiTMtKkEo97LPb/xVPrHR/CJUaDz7GFVi4NDIWllnI
         mqPOexQBcKMxUmIA+tS2Q3eocGU2aqBrgWmGsv5JiA28QexUmBdSbOMWiFbBYjuFfIdo
         F7Mw==
X-Gm-Message-State: AO0yUKVbz0Wit1EHlH/FPelq7gaMrDpe7/kRoMlOEg/CkwiYSy+fFfLD
	VEWwOPK3+I5l4NiQZ3hZPHBJK7lcyO9auWGNFg0=
X-Google-Smtp-Source: AK7set+61UDHNfaVyDjnb9KE3uGXt8IcOZiRwX5gaKEZM9CRklW+JKS47VqqJRoIXgxHGwe74NZv9cRtpTnOopn1OCQ=
X-Received: by 2002:a05:6102:11f7:b0:3f0:be66:8037 with SMTP id
 e23-20020a05610211f700b003f0be668037mr374687vsg.80.1676463802866; Wed, 15 Feb
 2023 04:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20230215104236.24484-1-gowtham.sureshkumar@arm.com> <20230215104236.24484-3-gowtham.sureshkumar@arm.com>
In-Reply-To: <20230215104236.24484-3-gowtham.sureshkumar@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 15 Feb 2023 12:23:11 +0000
Message-ID: <CANPvuRkftB6dqw2cLtTCmKQQodEixDYwN7NbTCNfUmm0ZdA6yw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/2] arm-bsp/uefi_capsule: Use json file to
 pass capsule config
To: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Cc: meta-arm@lists.yoctoproject.org, Ross.Burton@arm.com, nd@arm.com
Content-Type: multipart/alternative; boundary="00000000000072e41e05f4bc2543"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:23:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4392

--00000000000072e41e05f4bc2543
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gowtham,

Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com> escreveu no dia quarta,
15/02/2023 =C3=A0(s) 10:42:

> From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
>
> This patch uses the json config file for UEFI capsule generation
> as this is efficient and easily scalable to generate multiple
> capsules.
>
> Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
> ---
>  .../recipes-bsp/images/corstone1000-image.bb  |  8 +++---
>  ...rstone1000-image-capsule-update-image.json | 11 ++++++++
>  meta-arm/classes/uefi_capsule.bbclass         | 27 ++++++++++++-------
>  3 files changed, 32 insertions(+), 14 deletions(-)
>  create mode 100644
> meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update-i=
mage.json
>
> diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
> b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
> index b0a71bca..ce4df8a6 100644
> --- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
> +++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
> @@ -13,11 +13,9 @@ PACKAGE_INSTALL =3D ""
>
>  IMAGE_FSTYPES +=3D "wic wic.nopt uefi_capsule"
>
> -UEFI_FIRMWARE_BINARY =3D "corstone1000-image-${MACHINE}.wic.nopt"
> -UEFI_FIRMWARE_VERSION =3D "5"
> -UEFI_FIRMWARE_LSV =3D "0"
> -UEFI_FIRMWARE_GUID =3D "e2bb9c06-70e9-4b14-97a3-5a7913176e3f"
> -UEFI_FIRMWARE_UPDATE_INDEX =3D "0"
> +UEFI_FIRMWARE_BINARY =3D "${PN}-${MACHINE}.wic.nopt"
> +UEFI_CAPSULE_CONFIG =3D "${THISDIR}/files/${PN}-capsule-update-image.jso=
n"
> +CAPSULE_IMGTYPE =3D "wic.nopt"
>

Looks like this variable is not used anywhere.

Jose


>
>  do_sign_images() {
>      # Sign TF-A BL2
> diff --git
> a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update=
-image.json
> b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update=
-image.json
> new file mode 100644
> index 00000000..0f011ff7
> --- /dev/null
> +++
> b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-update=
-image.json
> @@ -0,0 +1,11 @@
> +{
> +    "Payloads": [
> +        {
> +            "FwVersion": "5",
> +            "Guid": "e2bb9c06-70e9-4b14-97a3-5a7913176e3f",
> +            "LowestSupportedVersion": "1",
> +            "Payload": "$UEFI_FIRMWARE_BINARY",
> +            "UpdateImageIndex": "0"
> +        }
> +    ]
> +}
> diff --git a/meta-arm/classes/uefi_capsule.bbclass
> b/meta-arm/classes/uefi_capsule.bbclass
> index 0c3d3845..cf708412 100644
> --- a/meta-arm/classes/uefi_capsule.bbclass
> +++ b/meta-arm/classes/uefi_capsule.bbclass
> @@ -1,6 +1,7 @@
>  # This class generates UEFI capsules
>  # The current class supports generating a capsule with single firmware
> binary
>
> +DEPENDS +=3D "gettext-native"
>  inherit python3native
>
>  IMAGE_TYPES +=3D "uefi_capsule"
> @@ -19,14 +20,11 @@ CAPSULE_EXTENSION ?=3D "uefi.capsule"
>
>  # The following variables must be set to be able to generate a capsule
> update
>  UEFI_FIRMWARE_BINARY ?=3D ""
> -UEFI_FIRMWARE_VERSION ?=3D ""
> -UEFI_FIRMWARE_LSV ?=3D ""
> -UEFI_FIRMWARE_GUID ?=3D ""
> -UEFI_FIRMWARE_UPDATE_INDEX ?=3D ""
> +UEFI_CAPSULE_CONFIG ?=3D ""
>
>  # Check if the required variables are set
>  python() {
> -    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_FIRMWARE_VERSION",
> "UEFI_FIRMWARE_LSV", "UEFI_FIRMWARE_GUID", "UEFI_FIRMWARE_UPDATE_INDEX"]:
> +    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_CAPSULE_CONFIG"]:
>          if not d.getVar(var):
>              raise bb.parse.SkipRecipe(f"{var} not set")
>  }
> @@ -36,10 +34,21 @@ IMAGE_CMD:uefi_capsule(){
>      # Force the GenerateCapsule script to use python3
>      export PYTHON_COMMAND=3D${PYTHON}
>
> -
> ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/Genera=
teCapsule
> -e -o \
> -    ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION}
> --fw-version ${UEFI_FIRMWARE_VERSION} \
> -    --lsv ${UEFI_FIRMWARE_LSV} --guid ${UEFI_FIRMWARE_GUID} --verbose
> --update-image-index \
> -    ${UEFI_FIRMWARE_UPDATE_INDEX} --verbose
> ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}
> +    # Copy the firmware and the capsule config json to current directory
> +    if [ -e ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} ]; then
> +        cp ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} . ;
> +    fi
> +
> +    export UEFI_FIRMWARE_BINARY=3D${UEFI_FIRMWARE_BINARY}
> +    envsubst < ${UEFI_CAPSULE_CONFIG} >
> ./${MACHINE}-capsule-update-image.json
> +
> +
> ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/Genera=
teCapsule
> \
> +    -e -o ${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \
> +    ${MACHINE}-capsule-update-image.json
> +
> +    # Remove the firmware to avoid contamination of IMGDEPLOYDIR
> +    rm ${UEFI_FIRMWARE_BINARY}
> +
>  }
>
>  # The firmware binary should be created before generating the capsule
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4391):
> https://lists.yoctoproject.org/g/meta-arm/message/4391
> Mute This Topic: https://lists.yoctoproject.org/mt/96980035/5052612
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000072e41e05f4bc2543
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Gowtham,</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Gowtham Suresh Kumar &lt;<a href=3D"mailto=
:gowtham.sureshkumar@arm.com">gowtham.sureshkumar@arm.com</a>&gt; escreveu =
no dia quarta, 15/02/2023 =C3=A0(s) 10:42:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">From: Gowtham Suresh Kumar &lt;<a href=3D"mailto=
:gowtham.sureshkumar@arm.com" target=3D"_blank">gowtham.sureshkumar@arm.com=
</a>&gt;<br>
<br>
This patch uses the json config file for UEFI capsule generation<br>
as this is efficient and easily scalable to generate multiple<br>
capsules.<br>
<br>
Signed-off-by: Gowtham Suresh Kumar &lt;<a href=3D"mailto:gowtham.sureshkum=
ar@arm.com" target=3D"_blank">gowtham.sureshkumar@arm.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-bsp/images/<a href=3D"http://corstone1000-image.bb" rel=
=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a>=C2=A0 |=C2=A0 8=
 +++---<br>
=C2=A0...rstone1000-image-capsule-update-image.json | 11 ++++++++<br>
=C2=A0meta-arm/classes/uefi_capsule.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 27 ++++++++++++-------<br>
=C2=A03 files changed, 32 insertions(+), 14 deletions(-)<br>
=C2=A0create mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000=
-image-capsule-update-image.json<br>
<br>
diff --git a/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://corstone1000=
-image.bb" rel=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a> b=
/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://corstone1000-image.bb" r=
el=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a><br>
index b0a71bca..ce4df8a6 100644<br>
--- a/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://corstone1000-image.=
bb" rel=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a><br>
+++ b/meta-arm-bsp/recipes-bsp/images/<a href=3D"http://corstone1000-image.=
bb" rel=3D"noreferrer" target=3D"_blank">corstone1000-image.bb</a><br>
@@ -13,11 +13,9 @@ PACKAGE_INSTALL =3D &quot;&quot;<br>
<br>
=C2=A0IMAGE_FSTYPES +=3D &quot;wic wic.nopt uefi_capsule&quot;<br>
<br>
-UEFI_FIRMWARE_BINARY =3D &quot;corstone1000-image-${MACHINE}.wic.nopt&quot=
;<br>
-UEFI_FIRMWARE_VERSION =3D &quot;5&quot;<br>
-UEFI_FIRMWARE_LSV =3D &quot;0&quot;<br>
-UEFI_FIRMWARE_GUID =3D &quot;e2bb9c06-70e9-4b14-97a3-5a7913176e3f&quot;<br=
>
-UEFI_FIRMWARE_UPDATE_INDEX =3D &quot;0&quot;<br>
+UEFI_FIRMWARE_BINARY =3D &quot;${PN}-${MACHINE}.wic.nopt&quot;<br>
+UEFI_CAPSULE_CONFIG =3D &quot;${THISDIR}/files/${PN}-capsule-update-image.=
json&quot;<br>
+CAPSULE_IMGTYPE =3D &quot;wic.nopt&quot;<br></blockquote><div><br></div><d=
iv>Looks like this variable is not used anywhere.</div><div><br></div><div>=
Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
=C2=A0do_sign_images() {<br>
=C2=A0 =C2=A0 =C2=A0# Sign TF-A BL2<br>
diff --git a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsu=
le-update-image.json b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-i=
mage-capsule-update-image.json<br>
new file mode 100644<br>
index 00000000..0f011ff7<br>
--- /dev/null<br>
+++ b/meta-arm-bsp/recipes-bsp/images/files/corstone1000-image-capsule-upda=
te-image.json<br>
@@ -0,0 +1,11 @@<br>
+{<br>
+=C2=A0 =C2=A0 &quot;Payloads&quot;: [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;FwVersion&quot;: &quot;5&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Guid&quot;: &quot;e2bb9c06=
-70e9-4b14-97a3-5a7913176e3f&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;LowestSupportedVersion&quo=
t;: &quot;1&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Payload&quot;: &quot;$UEFI=
_FIRMWARE_BINARY&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;UpdateImageIndex&quot;: &q=
uot;0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 ]<br>
+}<br>
diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uefi_=
capsule.bbclass<br>
index 0c3d3845..cf708412 100644<br>
--- a/meta-arm/classes/uefi_capsule.bbclass<br>
+++ b/meta-arm/classes/uefi_capsule.bbclass<br>
@@ -1,6 +1,7 @@<br>
=C2=A0# This class generates UEFI capsules<br>
=C2=A0# The current class supports generating a capsule with single firmwar=
e binary<br>
<br>
+DEPENDS +=3D &quot;gettext-native&quot;<br>
=C2=A0inherit python3native<br>
<br>
=C2=A0IMAGE_TYPES +=3D &quot;uefi_capsule&quot;<br>
@@ -19,14 +20,11 @@ CAPSULE_EXTENSION ?=3D &quot;uefi.capsule&quot;<br>
<br>
=C2=A0# The following variables must be set to be able to generate a capsul=
e update<br>
=C2=A0UEFI_FIRMWARE_BINARY ?=3D &quot;&quot;<br>
-UEFI_FIRMWARE_VERSION ?=3D &quot;&quot;<br>
-UEFI_FIRMWARE_LSV ?=3D &quot;&quot;<br>
-UEFI_FIRMWARE_GUID ?=3D &quot;&quot;<br>
-UEFI_FIRMWARE_UPDATE_INDEX ?=3D &quot;&quot;<br>
+UEFI_CAPSULE_CONFIG ?=3D &quot;&quot;<br>
<br>
=C2=A0# Check if the required variables are set<br>
=C2=A0python() {<br>
-=C2=A0 =C2=A0 for var in [&quot;UEFI_FIRMWARE_BINARY&quot;, &quot;UEFI_FIR=
MWARE_VERSION&quot;, &quot;UEFI_FIRMWARE_LSV&quot;, &quot;UEFI_FIRMWARE_GUI=
D&quot;, &quot;UEFI_FIRMWARE_UPDATE_INDEX&quot;]:<br>
+=C2=A0 =C2=A0 for var in [&quot;UEFI_FIRMWARE_BINARY&quot;, &quot;UEFI_CAP=
SULE_CONFIG&quot;]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not d.getVar(var):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(f=
&quot;{var} not set&quot;)<br>
=C2=A0}<br>
@@ -36,10 +34,21 @@ IMAGE_CMD:uefi_capsule(){<br>
=C2=A0 =C2=A0 =C2=A0# Force the GenerateCapsule script to use python3<br>
=C2=A0 =C2=A0 =C2=A0export PYTHON_COMMAND=3D${PYTHON}<br>
<br>
-=C2=A0 =C2=A0 ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/Pos=
ixLike/GenerateCapsule -e -o \<br>
-=C2=A0 =C2=A0 ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXT=
ENSION} --fw-version ${UEFI_FIRMWARE_VERSION} \<br>
-=C2=A0 =C2=A0 --lsv ${UEFI_FIRMWARE_LSV} --guid ${UEFI_FIRMWARE_GUID} --ve=
rbose --update-image-index \<br>
-=C2=A0 =C2=A0 ${UEFI_FIRMWARE_UPDATE_INDEX} --verbose ${CAPSULE_IMGLOCATIO=
N}/${UEFI_FIRMWARE_BINARY}<br>
+=C2=A0 =C2=A0 # Copy the firmware and the capsule config json to current d=
irectory<br>
+=C2=A0 =C2=A0 if [ -e ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} ]; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINA=
RY} . ;<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 export UEFI_FIRMWARE_BINARY=3D${UEFI_FIRMWARE_BINARY}<br>
+=C2=A0 =C2=A0 envsubst &lt; ${UEFI_CAPSULE_CONFIG} &gt; ./${MACHINE}-capsu=
le-update-image.json<br>
+<br>
+=C2=A0 =C2=A0 ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/Pos=
ixLike/GenerateCapsule \<br>
+=C2=A0 =C2=A0 -e -o ${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -j \<br>
+=C2=A0 =C2=A0 ${MACHINE}-capsule-update-image.json<br>
+<br>
+=C2=A0 =C2=A0 # Remove the firmware to avoid contamination of IMGDEPLOYDIR=
<br>
+=C2=A0 =C2=A0 rm ${UEFI_FIRMWARE_BINARY}<br>
+<br>
=C2=A0}<br>
<br>
=C2=A0# The firmware binary should be created before generating the capsule=
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#4391): <a href=3D"https://lists.yoctoproject.org/g/meta=
-arm/message/4391" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/g/meta-arm/message/4391</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/96980035/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/96980035/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-arm%2Bowner@lists.yoctoproject.org" tar=
get=3D"_blank">meta-arm+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arm/unsub" re=
l=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ar=
m/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">q=
uaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000072e41e05f4bc2543--

