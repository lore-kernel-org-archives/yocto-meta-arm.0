Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E75C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 13:54:23 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.13467.1713448459132327987
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 06:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDxCwyUN;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: vvavrychuk@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2db7c6b5598so12644121fa.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Apr 2024 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713448457; x=1714053257; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/Deo+hZyrtcNjnWq3dqN1E95hMDXPvVkA5ji1LN+qE=;
        b=nDxCwyUN8XjG0kFLzL9dYm+xmEK8jb1RZAZFXbFmGcYSAjrk+LTtgjm5Skp3+QZgx6
         8C387TTM1GuXqm99U2MECN3o9243GoecSTfEcymbeSo+LAPor3KVI5BJrygjpmQiW5sM
         dwM3BzzESwkPhpBLhZNf5dqsC2eEIlLdQGdHLMuFwEWUo44Rh7ecjsawu/YHgDcg3xlD
         rE3Nxzc96/Z09OR+u5hUQGsMEmS8kr4l05Zho0vVImM8i9hDc8cVaMQOiL2JoNMj3Nq/
         lxRIkjlBJQrdunY1SCsnWxFxXwjW9ymxc0ATJYvrD6oAXnJsgkFbdaxuW4s5IkVyfhCI
         u8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713448457; x=1714053257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/Deo+hZyrtcNjnWq3dqN1E95hMDXPvVkA5ji1LN+qE=;
        b=MKurphWkv85UKVn2asOUDI2X02HYm7+n4mcZjBZCizVF3Nrdylm1dfUx4pSgQY9hF9
         Er8NfqMv1Z31DjGSHd/fde79UNE2b2uxVAM2VN8KUoT8BC81/9o5mb741mF8/VYX3mvB
         dv0dUIn/wPARtUtKQknt4N3+pcXU6EqETtf0WnrXEh28eLGFtGhDP2FCEuWvIoouQzfR
         y4ldsi4Bx5dGWmt6D/p05y20V0Ueunu2uWC+KaJ26tOzJ/fa3l4JkYpdWo6URrEZj7Mt
         wNSxZFcVYrlmf3Ki93XW/74PTnlglkthDVLkHS8sRJZOGfYtFwssi2giz2/f9xSEsFaY
         VGMA==
X-Forwarded-Encrypted: i=1; AJvYcCXfmqrE8SlFJu1IH00shfNGKxSEI3uPQUGCKQM6bKwiTB41g9/tP+hu8wyWDYTPUEbm7SXaINLkjGH+mPe9KL1Xwb3Vm3HMohf5CRe8hB5H
X-Gm-Message-State: AOJu0YxBOY1sq/vHOAHIBVU21ifcB+Kr1UOpwNyn/+q/0bJTK+WOOzwW
	FPka07K2bMHsqyroXeJD01K299irks9iXWNseYhhC5hNXHkE9c+Iv6G6WL0X/eHD0LsMz2bPJ6f
	AcaXE5V5oVLCfNCs7ZCopht3Cewk=
X-Google-Smtp-Source: AGHT+IEdhrWotFWnsDryqRcDRA+MayFe8Aegj6APuKCCfZvPyZuUqhjL/BsDXuzRZzlREPq/RpwpmyevpHluz5bDMo0=
X-Received: by 2002:a2e:b177:0:b0:2db:175d:a253 with SMTP id
 a23-20020a2eb177000000b002db175da253mr1862989ljm.47.1713448457056; Thu, 18
 Apr 2024 06:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240417113042.91880-1-vvavrychuk@gmail.com> <20240417113042.91880-3-vvavrychuk@gmail.com>
 <20240417201213.GU28791@denix.org>
In-Reply-To: <20240417201213.GU28791@denix.org>
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Date: Thu, 18 Apr 2024 16:54:05 +0300
Message-ID: <CAGj4m+47gi6kai=_5ubCtqoz-Qis_uNgERLEn=Ho1otpH0pfRg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/3] external-arm-toolchain: in libc.so GNU ld
 script use base_libdir
To: Denys Dmytriyenko <denis@denix.org>
Cc: Ross Burton <ross.burton@arm.com>, Denys Dmytriyenko <denys@konsulko.com>, 
	meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Apr 2024 13:54:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5564

On Wed, Apr 17, 2024 at 11:12=E2=80=AFPM Denys Dmytriyenko <denis@denix.org=
> wrote:
>
> On Wed, Apr 17, 2024 at 02:30:41PM +0300, Vasyl Vavrychuk wrote:
> > -             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${E=
AT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LI=
BDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_L=
IBDIR}/ld-linux#g" ${D}${libdir}/libc.so
> > +             sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${E=
AT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LI=
BDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${base_=
libdir}/ld-linux#g" ${D}${libdir}/libc.so
>
> Here ^^^ it's not clear why only the last of the sed replacements gets
> updated, not all of them?

1. `/${EAT_LIBDIR}/${EAT_TARGET_SYS}` path is not used in libc.so in
Arm GNU Toolchain v13.2.Rel1 in targets "arm-none-linux-gnueabihf" and
"aarch64-none-linux-gnu". I am not sure in which versions for ARM or
Linaro toolchain this path was used in libc.so. Should I replace it
blindly?
2. Rest two expressions replace input string to "/usr/lib" or ".", so
they are not affected by usrmerge.

