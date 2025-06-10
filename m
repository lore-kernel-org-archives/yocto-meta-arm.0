Return-Path: <marek.bykowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDB0C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 11:49:06 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.84939.1749556138680012965
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 04:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L46kIoIA;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: marek.bykowski@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6facacf521eso56093416d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749556138; x=1750160938; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pHbHMwZrfOzDZABqGuimtv55T7J9r5QlRrpNMGkVME=;
        b=L46kIoIAwgQjaLU461YEuVmHR0mU/cOfrfEGscuTZOD/Oh/pwHLNiS45lR+BkgcXcu
         /Dc0/vBHloHDgllT3MRef7z2G7BpihkxjcR1jhdXk+MqrzK0ndyzH1PwZ+Bu0klfPBCn
         33Hvj3nz37KhkKLAMeI+vrrMzM3uQ6bFzkAvRl7Rnt+V/MdyGGQ33nhI/UP9qXVKuAx1
         TwBj4gvsbch1DWCRRUt821TCRy8xz6L9n1FSKsAcFudz2soveI7F/bpN73q5gSy+29j8
         KkeXcJ86Lw2We28IhZ88RcvnyptHU2/8xsx1qoi86tmh3xQt5Hx4q/XBJikWhyOrocUg
         110g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556138; x=1750160938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pHbHMwZrfOzDZABqGuimtv55T7J9r5QlRrpNMGkVME=;
        b=fSRyjwE7J5silk5kl9ERaHWGNtiDqHfDGW5ZiCm4cilNfGxXwvz7wexX0B4jjZVD+g
         ipk7x85d7MHdYFq2AQartw8WGNLE0QPAvKp8VU+3fRjoKmPX9cJUe5cZ3SnzjovsgRXA
         vDq3lkFYCBIpNVSkCqDGDtsjj9bwSQH5JUrE9wUElyAB3LUt1cQahb9kGSWKzl7rDchX
         c/LO74ShPC2STRtV4faVV2MY+Ymm8bhBSvj1G66RCZHPhU67YLVnvKjmLBDZ5Q+l0FS+
         Uii1Eym/xbdyZ3JZbmpWPp7GlUqXefSaz/5wJRE2s1Ct04hMPPEUjlbL5ZrxD5pFpnDW
         DnSw==
X-Gm-Message-State: AOJu0YzYWZL4P3fneFrjUVrEdM5vm9NXRcv1sTQNpO/3MaEoVgJ3oCCP
	83sqdAgxUuLEnW8F8Rs+8uSvscet9pP+hVtQ3rgoU2kYJit4Yj8qAvw4AaI1MvFlYUWD5rXPfSd
	uaDA/m91um1Eo7YoQEgl4uVUYv5nTLxY=
X-Gm-Gg: ASbGncuZACdsK6YYD6iGhEtMOwTlhvuYjEGm8IuIS7VRwZnv+pNsdCSxoiq729eFRnw
	cUL90lr3YqZLT1C0G6NxVtXldiVX1elCKC9N7EOiej9cOFSkFNpR5uRX2XclRuXbPGhBy2K+Sqx
	RwfeFRyUgcrAste7CS4vdhHMQHOLOChxiNcaLaBo6btao=
X-Google-Smtp-Source: AGHT+IEV/sEJiMrTjZk0rw1DnG1drfhw1n1a1rxQ/JavEfzLR0/zStTvn6Mynzz1iitXvks3LAVaEtQeTRolsAU6aPc=
X-Received: by 2002:ad4:5967:0:b0:6fb:3d7:71bb with SMTP id
 6a1803df08f44-6fb24c4f420mr36375966d6.1.1749556137598; Tue, 10 Jun 2025
 04:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHw2UgDSp9jK_9Q0FsdfiGPdmWmGQRTfiTQoBg=ZrD16q0ucXA@mail.gmail.com>
 <09231705-62A7-4D39-B395-D670B097BBB0@arm.com> <CAHw2UgCz_nCWMLJkSRFu6mYza=_x2i8-a1bPfF+nCCAWxWoC-g@mail.gmail.com>
In-Reply-To: <CAHw2UgCz_nCWMLJkSRFu6mYza=_x2i8-a1bPfF+nCCAWxWoC-g@mail.gmail.com>
From: Marek <marek.bykowski@gmail.com>
Date: Tue, 10 Jun 2025 13:48:47 +0200
X-Gm-Features: AX0GCFum3zIOAvtBBa90-FFLExd_25A0WQ5zn6G9vBHv0XjpUxKDoVzL7OCaUos
Message-ID: <CAHw2UgA_vK3Qk2bSu9kJ23R3HwPHM4m+kDRyzJG5OwpTfCftcg@mail.gmail.com>
Subject: Re: [meta-arm] fvp-base doesn't support armv8.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 11:49:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6539

I forked off the scarthgap branch some time ago (SHA1 commit and date
below), parked and recently resumed my work on it.

$ git branch -r --contains a8fe9d22eaefc294f91096c6a32663e2f4ab3b10
  origin/scarthgap
$ git log --format=3Dformat:%cd -1 a8fe9d22eaefc294f91096c6a32663e2f4ab3b10
Mon Jan 6 06:00:11 2025 -0500

My goal is to have a Cortex-A55 simulated which is armv8.2.

I followed Ross's suggestion

meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc

-EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4"
+EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D2"

and it worked. Seeing the model booted up to Linux prompt.

Connected with arm ds and the midr_el1 shows me this MIDR_EL1 0x410FD0F0 32=
 RO.
Implementer Arm Limited. 8 RO
Variant 0x0 4 RO
Architecture Architectural features are individually identified in the
ID_* registers. 4 RO
PartNum 0xD0F 12 RO
Revision 0x0 4 RO

I guess for the ARM AEM models there is really no way to read it back
if the model implements version 8.2, isn' it?





On Tue, 10 Jun 2025 at 12:42, Marek <marek.bykowski@gmail.com> wrote:
>
> Thanks Jon and Ross!
>
> On Mon, 9 Jun 2025 at 15:54, Ross Burton <Ross.Burton@arm.com> wrote:
> >
> > On 8 Jun 2025, at 21:14, Marek Bykowski via lists.yoctoproject.org <mar=
ek.bykowski=3Dgmail.com@lists.yoctoproject.org> wrote:
> > >
> > > When I simply change to "require conf/machine/include/arm/arch-armv8-=
2a.inc" and "FVP_CONFIG[cluster0.has_arm_v8-2] =3D "1"" and "FVP_CONFIG[clu=
ster1.has_arm_v8-2] =3D "1" " the FVP_Base_RevC-2xAEMvA doesn't boot at all=
. I do not see even a single line of log even from bl1. Would that mean the=
 SW stack/Yocto doesn't support armv8.2 for fvp-base model platform?
> >
> > If you=E2=80=99re using a recent meta-arm which sets the base-fvp to v8=
.4 cores, then you didn=E2=80=99t also tell TF-A to use 8.2 and it might ha=
ve been trying to use 8.4 instructions.  See this in the TF-A recipe:
> >
> > EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4=E2=80=9D
> >
> > Ross
>
>
>
> --
> Sl=C3=A1n,
> Marek



--
Sl=C3=A1n,
Marek

