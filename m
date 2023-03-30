Return-Path: <rui.silva@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C818C761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 07:15:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.19190.1680160501190725987
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 00:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YP2W8vOz;
 spf=pass (domain: linaro.org, ip: 209.85.128.43, mailfrom: rui.silva@linaro.org)
Received: by mail-wm1-f43.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so7502863wmq.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 00:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680160499;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9f8fw4d0R95Zw+/0xo90khGLaP+xVYxouAzuk4SURM=;
        b=YP2W8vOzyh6NH/MgGV+M1uyiBrFG6uDCZplPTciLJ9l8YvFgin0xevip08JHTqv+9N
         OG/hRB1KOI+3FqhhIIH8v4Y7I8MkUihBp3ho3+xN6HcLlb7aT8Ao6pOX9I4sLMA0k+vS
         VlUE1E6sjrFYe57LF2TJaFc0NbCBHvAp/kW+XQrm8S15snktvvI34HnHacHsk/SJHE2B
         dDk0zQU3g6r228GlSA5BPN+O6dEr2IMVEpUo7R/wbmskUrLcj2DuwVDMtG8kkuYVeZhe
         hZclTsp1AzirkcCWKuW27j2yrDUkOFZ2aJvg+fmiBbnx0D1uPzeIUuDKG5hhekwSVN4/
         4L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680160499;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m9f8fw4d0R95Zw+/0xo90khGLaP+xVYxouAzuk4SURM=;
        b=tt5pkzihmAvRkILM5z7oh02Qe8LaWS+18nRrtkFo2G5OwaxO/qIq0nZSM/HBZH2Aec
         xPGOXi3trfNf9VTYkYEIPmzvpXZ6qhUPMUuIhIyJXjCvbY7ldIUaBvWeOkpTyTxc9nD2
         yhQCOpWvtN7hZrKvYAmSXZqlPtMR8510+ulkvwfedky4BDHFe42emQ+mVCGmap0GW3Rh
         SNch6WxPKOhbgUFzwDMieyh/rhe9XyKRIYjLo8kw2NiUdY5QIiXKj/WnRcNhtI18MO0E
         YBb+lSIgH566tQXcIgsLgxZnq+Uqyr7jX3s4gy+PxhfKzejWED5lsadS+PhyaFABgl1W
         alFQ==
X-Gm-Message-State: AO0yUKWd4dxW9Ti8Q2k2oy5reBQ7JWrvLcqn1cN1YQ/NCfs5EBwc87NC
	9M0tQrNz3/c9Q3QpSqMX2QhiaQ==
X-Google-Smtp-Source: AK7set+yTGLVjjMF/sra9kK/YpZzHjfnLRz0ZxsuEpVNBsXZgbNWuRjjpl0Q4i+iPEi2hkf4qxP76w==
X-Received: by 2002:a05:600c:22d6:b0:3ed:e5db:52e1 with SMTP id 22-20020a05600c22d600b003ede5db52e1mr17707864wmg.15.1680160498951;
        Thu, 30 Mar 2023 00:14:58 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id k24-20020a05600c0b5800b003f0373d077csm924143wmr.47.2023.03.30.00.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 00:14:58 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/optee: bump corstone1000 to v3.20
In-Reply-To: <CANPvuRnZRdJkuW213b2Pvxp3+HNfxyRwPsP81S8SAQj6=fi6tw@mail.gmail.com>
References: <20230329161613.812217-1-rui.silva@linaro.org>
 <CANPvuR=mFEJ-03fo5JZcW-+oyKH5i+hzf+Jm4E3r37uxeRRgTQ@mail.gmail.com>
 <m31ql7xtb2.fsf@gmail.com>
 <CANPvuRnZRdJkuW213b2Pvxp3+HNfxyRwPsP81S8SAQj6=fi6tw@mail.gmail.com>
Date: Thu, 30 Mar 2023 08:14:57 +0100
Message-ID: <m3y1neww0e.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 07:15:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4509

Hi Jose,

Jose Quaresma <quaresma.jose@gmail.com> writes:

> Hi,
>
> Reply directly to Rui but not for the mailing list so forward it.

Sorry about that.

>
> Rui Miguel Silva <rui.silva@linaro.org> escreveu no dia quarta, 29/03/2023
> =C3=A0(s) 20:15:
>
>> Oi Jose,
>>
>> Thanks for the review.
>>
>> Jose Quaresma <quaresma.jose@gmail.com> writes:
>>
>> > Hi Rui,
>> >
>> > Rui Miguel Silva <rui.silva@linaro.org> escreveu no dia quarta,
>> 29/03/2023
>> > =C3=A0(s) 17:15:
>> >
>> >> Bump the preferred corstone1000 to v3.20, drop patch
>> >> that is already included in this version.
>> >> Create the 3.20 bbappend and remove the entry in 3.18 bbappend.
>> >>
>> >> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>> >> ---
>> >>  .../conf/machine/include/corstone1000.inc     |  2 +-
>> >>  .../0004-Handle-logging-syscall.patch         | 33 -----------------=
--
>> >>  .../optee/optee-os-corstone1000-common.inc    |  8 -----
>> >>  .../optee/optee-os_3.18.0.bbappend            |  1 -
>> >>  .../optee/optee-os_3.20.0.bbappend            |  6 ++++
>> >>  5 files changed, 7 insertions(+), 43 deletions(-)
>> >>  delete mode 100644
>> >>
>> meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-Han=
dle-logging-syscall.patch
>> >>  create mode 100644
>> >> meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
>> >>
>> >> diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc
>> >> b/meta-arm-bsp/conf/machine/include/corstone1000.inc
>> >> index 7f25cd54455f..3915d18b5627 100644
>> >> --- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
>> >> +++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
>> >> @@ -34,7 +34,7 @@ UBOOT_ARCH =3D "arm"
>> >>  UBOOT_EXTLINUX =3D "0"
>> >>
>> >>  #optee
>> >> -PREFERRED_VERSION_optee-os ?=3D "3.18.%"
>> >> +PREFERRED_VERSION_optee-os ?=3D "3.20.%"
>> >>  PREFERRED_VERSION_optee-client ?=3D "3.18.%"
>> >>  EXTRA_IMAGEDEPENDS +=3D "optee-os"
>> >>  OPTEE_ARCH =3D "arm64"
>> >> diff --git
>> >>
>> a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-H=
andle-logging-syscall.patch
>> >>
>> b/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-H=
andle-logging-syscall.patch
>> >> deleted file mode 100644
>> >> index 356be9e04f9e..000000000000
>> >> ---
>> >>
>> a/meta-arm-bsp/recipes-security/optee/files/optee-os/corstone1000/0004-H=
andle-logging-syscall.patch
>> >> +++ /dev/null
>> >> @@ -1,33 +0,0 @@
>> >> -Upstream-Status: Pending [Not submitted to upstream yet]
>> >> -Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
>> >> -
>> >> -From b3fde6c2e1a950214f760ab9f194f3a6572292a8 Mon Sep 17 00:00:00 20=
01
>> >> -From: Balint Dobszay <balint.dobszay@arm.com>
>> >> -Date: Fri, 15 Jul 2022 13:45:54 +0200
>> >> -Subject: [PATCH] Handle logging syscall
>> >> -
>> >> -Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
>> >> -Change-Id: Ib8151cc9c66aea8bcc8fe8b1ecdc3f9f9c5f14e4
>> >> -
>> >> -%% original patch: 0004-Handle-logging-syscall.patch
>> >> -
>> >> -diff --git a/core/arch/arm/kernel/spmc_sp_handler.c
>> >> b/core/arch/arm/kernel/spmc_sp_handler.c
>> >> -index e0fa0aa6..c7a45387 100644
>> >> ---- a/core/arch/arm/kernel/spmc_sp_handler.c
>> >> -+++ b/core/arch/arm/kernel/spmc_sp_handler.c
>> >> -@@ -1004,6 +1004,12 @@ void spmc_sp_msg_handler(struct thread_smc_ar=
gs
>> >> *args,
>> >> -                       ffa_mem_reclaim(args, caller_sp);
>> >> -                       sp_enter(args, caller_sp);
>> >> -                       break;
>> >> -+              case 0xdeadbeef:
>> >> -+                      ts_push_current_session(&caller_sp->ts_sess);
>> >> -+                      IMSG("%s", (char *)args->a1);
>> >> -+                      ts_pop_current_session();
>> >> -+                      sp_enter(args, caller_sp);
>> >> -+                      break;
>> >> -               default:
>> >> -                       EMSG("Unhandled FFA function ID %#"PRIx32,
>> >> -                            (uint32_t)args->a0);
>> >> ---
>> >> -2.17.1
>> >> -
>> >> diff --git
>> >> a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
>> >> b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
>> >> index 71b5ee62b902..30f99666626c 100644
>> >> ---
>> a/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
>> >> +++
>> b/meta-arm-bsp/recipes-security/optee/optee-os-corstone1000-common.inc
>> >> @@ -1,15 +1,7 @@
>> >> -SRCREV =3D "42f6617108fa43712652ef52f9d5b4ec5b2665f8"
>> >> -PV =3D "3.18.0+git${SRCPV}"
>> >> -
>> >>  SRC_URI:remove =3D " \
>> >>                    file://0003-core-link-add-no-warn-rwx-segments.pat=
ch
>> \
>> >>                   "
>> >>
>> >> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/optee-os/corstone1000=
:"
>> >> -SRC_URI:append =3D " \
>> >> -                  file://0004-Handle-logging-syscall.patch \
>> >> -                 "
>> >> -
>> >>  COMPATIBLE_MACHINE =3D "corstone1000"
>> >>
>> >>  OPTEEMACHINE =3D "corstone1000"
>> >> diff --git
>> a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
>> >> b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
>> >> index 4b03985ac97a..bc933dd54c48 100644
>> >> --- a/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
>> >> +++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend
>> >> @@ -3,6 +3,5 @@
>> >>  MACHINE_OPTEE_OS_REQUIRE ?=3D ""
>> >>  MACHINE_OPTEE_OS_REQUIRE:n1sdp =3D "optee-os-n1sdp.inc"
>> >>  MACHINE_OPTEE_OS_REQUIRE:tc =3D "optee-os-tc.inc"
>> >> -MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D
>> "optee-os-corstone1000-common.inc"
>> >>
>> >>  require ${MACHINE_OPTEE_OS_REQUIRE}
>> >> diff --git
>> a/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
>> >> b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
>> >> new file mode 100644
>> >> index 000000000000..e732c80f880b
>> >> --- /dev/null
>> >> +++ b/meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend
>> >> @@ -0,0 +1,6 @@
>> >> +# Machine specific configurations
>> >> +
>> >> +MACHINE_OPTEE_OS_REQUIRE ?=3D ""
>> >> +MACHINE_OPTEE_OS_REQUIRE:corstone1000 =3D
>> "optee-os-corstone1000-common.inc"
>> >> +
>> >> +require ${MACHINE_OPTEE_OS_REQUIRE}
>> >>
>> >
>> > This will generate a bitbake parse error for other machines than
>> > corstone1000.
>> >
>> > Jose
>>
>> This pattern is used all over meta-arm/meta-arm-bsp, I see what you are
>> saying, that: require "" throws a bitbake error. But I guess that every
>> machine needs a require for specifying optee_os platform configuration
>> and details.
>>
>
> I think the issue is because now with the optee-os_3.20 bbappend the n1sdp
> and the tc override don't apply
> so the MACHINE_OPTEE_OS_REQUIRE can be blank which will trigger the parsi=
ng
> error.

But doesn't n1sdp and tc use the 3.18 bbappend? Here in the CI it is not
failing to build for that platforms.

Cheers,
   Rui
=20=20=20
>
> Jose
>
>
>>
>> @Ross, @Jon am I missing something here?
>>
>> Cheers,
>>   Rui
>> >
>> >
>> >> --
>> >> 2.34.1
>> >>
>> >>
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> Links: You receive all messages sent to this group.
>> >> View/Reply Online (#4506):
>> >> https://lists.yoctoproject.org/g/meta-arm/message/4506
>> >> Mute This Topic: https://lists.yoctoproject.org/mt/97932156/5052612
>> >> Group Owner: meta-arm+owner@lists.yoctoproject.org
>> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [
>> >> quaresma.jose@gmail.com]
>> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >>
>> >>
>> >
>> > --
>> > Best regards,
>> >
>> > Jos=C3=A9 Quaresma
>>
>
>
> --=20
> Best regards,
>
> Jos=C3=A9 Quaresma

