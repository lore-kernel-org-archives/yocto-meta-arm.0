Return-Path: <daniel.diaz@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BA8C636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 15:25:52 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.26128.1675265144208741006
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Feb 2023 07:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MkWS8aY7;
 spf=pass (domain: linaro.org, ip: 209.85.210.171, mailfrom: daniel.diaz@linaro.org)
Received: by mail-pf1-f171.google.com with SMTP id ay1so12745659pfb.7
        for <meta-arm@lists.yoctoproject.org>; Wed, 01 Feb 2023 07:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOAmoIqeWKoCGdaW/ZEOpCj6Ilb+dciS0tCWDRfwy+w=;
        b=MkWS8aY77AtCQXztPxkLte4zxlGAdp5m4tOaha8lvLrkqCDBWJCNQUxkB6IN/HLIPZ
         RvNXQKf2SzuEWE2Kxg442IswPYrtlRMU942H8eStl4xHrEyMeU748qxSQB6hMYunftoO
         a3GIKkLdVE8xRT2HeNO3QKu4R7FglQy+VI4VwqyHznC9+sVAmUTkIkv/ZogWmVDbeOOR
         tAPnDrqwsjBZaRv0kRf/JB3bv7rW61zaH9/0QXxEtjwvkBPuVQFhkts13e1NDAjaFNG3
         nzJtFmsvZbFwg/zBYeeOVMDnNh+aBRyrUjLQviAWO/9tIB6FvTFFPlhtZ3imNRsCsrQu
         fxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOAmoIqeWKoCGdaW/ZEOpCj6Ilb+dciS0tCWDRfwy+w=;
        b=cn4yJTomX9lIA7eHiTlmD6TKhXnFmsiIsowFF2ChI0XDeIossZEL8QuRFpMOBI15iy
         20MaPL34MQli1Aw5+4z0HTn1/cdG9p0EtvaVccfTDsaBAcuF+dDg6m/K1PXMF8HhvL7R
         v4hOAsqlKSq22ymvgUL4qOBaZqGuidnmfuJ70PsTBRL8Yot9bPacSQ7j6rNW/pty/gwm
         9iNH+9DfBuYwnqopWc7LFGFu5eioAJRAH55CGVMR7vYFwF7w4maPn2gkz580dIKj/4fH
         Z61SN5ysEsZN+EyACGuxfSda90gSonsYbBp65FEGT2hUPhMOW9IBQlTTmJWN0flBOhu/
         M/Ig==
X-Gm-Message-State: AO0yUKX7E0h5yY+6pbI4iQCdFngGERHEXySxdNk5bUWG/tyt9RP3UAUI
	IGBMyIoCvUpT4c24GFcZJjg19eUsP5nF6svST8bqRw==
X-Google-Smtp-Source: AK7set/9ym/WaX7MZqCyh0fzzWtUYgOPayCC8jSB9uuV5bJVoL0R2gztddm2v26T/UIUkhHciU9hbNRlG+fAyCYNfk4=
X-Received: by 2002:aa7:96ac:0:b0:58d:bb58:ac78 with SMTP id
 g12-20020aa796ac000000b0058dbb58ac78mr622119pfk.48.1675265143436; Wed, 01 Feb
 2023 07:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20230126193307.154631-1-daniel.diaz@linaro.org> <167484388780.842866.15472646845143575850.b4-ty@arm.com>
In-Reply-To: <167484388780.842866.15472646845143575850.b4-ty@arm.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Wed, 1 Feb 2023 09:25:31 -0600
Message-ID: <CAEUSe7-wav0Ar=W_b6nOeBkKnOCgyzhT4TKAUYirDKZ0Oj0KGA@mail.gmail.com>
Subject: Re: [PATCH] arm-bsp/firmware-image-juno: Fix deployment of compressed Image
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Feb 2023 15:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4345

Hello!

On Fri, 27 Jan 2023 at 12:25, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Thu, 26 Jan 2023 13:33:07 -0600, Daniel D=C3=ADaz wrote:
> > A recent commit compressed the kernel image (to Image.gz) and
> > by default enabled an initramfs image. In the case for when
> > such that (initramfs) is not desirable, the deploy step of the
> > Juno firmware will still try to install the Image file, (not
> > Image.gz), so this fails:
> >
> >   ERROR: firmware-image-juno-1.0-r0 do_deploy: ExecutionError('/oe/buil=
d/tmp-glibc/work/juno-oe-linux/firmware-image-juno/1.0-r0/temp/run.do_deplo=
y.360477', 1, None, None)
> >   ERROR: Logfile of failure stored in: /oe/build/tmp-glibc/work/juno-oe=
-linux/firmware-image-juno/1.0-r0/temp/log.do_deploy.360477
> >   Log data follows:
> >   | DEBUG: Executing python function sstate_task_prefunc
> >   | DEBUG: Python function sstate_task_prefunc finished
> >   | DEBUG: Executing shell function do_deploy
> >   | cp: cannot stat '/oe/build/tmp-glibc/deploy/images/juno/Image': No =
such file or directory
> >   | WARNING: /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-juno=
/1.0-r0/temp/run.do_deploy.360477:152 exit 1 from 'cp -L -f /oe/build/tmp-g=
libc/deploy/images/juno/Image /oe/build/tmp-glibc/work/juno-oe-linux/firmwa=
re-image-juno/1.0-r0/image/juno-firmware-19.06/SOFTWARE/'
> >   | WARNING: Backtrace (BB generated script):
> >   |   #1: do_deploy, /oe/build/tmp-glibc/work/juno-oe-linux/firmware-im=
age-juno/1.0-r0/temp/run.do_deploy.360477, line 152
> >   |   #2: main, /oe/build/tmp-glibc/work/juno-oe-linux/firmware-image-j=
uno/1.0-r0/temp/run.do_deploy.360477, line 163
> >   NOTE: recipe firmware-image-juno-1.0-r0: task do_deploy: Failed
> >   ERROR: Task (../meta-arm/meta-arm-bsp/recipes-bsp/images/firmware-ima=
ge-juno.bb:do_deploy) failed with exit code '1'
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] arm-bsp/firmware-image-juno: Fix deployment of compressed Image
>       commit: 99b769e6ce4ed722386883a01be6adb7ce18a622

Can this be backported to Kirkstone? That's where it broke our builds.

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

