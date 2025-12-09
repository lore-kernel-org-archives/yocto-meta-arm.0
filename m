Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85517D3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:51:53 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10906.1765295511722151112
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 07:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=axUJ/swk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.44, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3ed151e8fc3so3481261fac.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Dec 2025 07:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1765295511; x=1765900311; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZaqOmoJs2lv6iuOxVAfVGUpVyi/g3DOr6Vd/EUem74=;
        b=axUJ/swk59dBHOpsNWrTI+8hosPtn4EBjsVrCcSelJOcYptGuVVbi20XxQeiqrX+Hm
         mBAOhl5k7aHxqe4Tz0ghunGcpzEE1crmnO6Rd6s9eb1BBB1UiHkqjGBSEpEUSfjPLVnZ
         dtkCHTIqtkkv74DyAytNAEJ9G5HtBo8LdZkZYRsKQpEb1Xfk9kmJZVeRYbmRM5ksFKLt
         iJxPiifqPZI+e0OCYcS0sSx3C+Jd/Ab0iXJko5ac3daQpEeO9nAjSwYlr5Q/aWLpsUCO
         x9wQ6uKuVRAXH66P0p0T7b5VleKTOvxFzEJWjdPEIasEBtaY1EDGXYMZGr8aEJbDn2JP
         va+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295511; x=1765900311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZaqOmoJs2lv6iuOxVAfVGUpVyi/g3DOr6Vd/EUem74=;
        b=cAAv1kmU3v9B4CGD+6wX63YvUkYPmhHHFSDOE6pw6wyv9VQd67L0qjs6ACIA22jZW0
         mk7S0GryE0lROoGxUazc6zpnu2Pg1udNZOgJ44PUvltnROMRXJEJ02TREm/Bwr3kWnZA
         61T59beBOavt/xwnPoqngiM/fVkqIG7V3/Rdwj6l0fDicM6n9XMFmBy5k9TJDT2Dq5OZ
         8fXplEx6CON/1f8fw5/nqc79FDSb+Kn/5x5MI+UbpAGqO6TerxoSuJNTp2QUarCU5IWb
         qf9Z5vT1SnXqGaFHBrwN30n29Nk0wiXPCUOAy2zn2jjJ7O5HWi/RKyUUU81/pmQapaXx
         OyDw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ51dzZyN1LbJTUVQw+X+jGEQIBZvahFmDe24gd/tdNaAuSbRKJQkgRMsJBsz7HckGZtJvMeGJPQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzJwn8VaLSxN76E66hkKfgNNX7K1rp7L5ybiGEshYiM+WzY/mbB
	+4DO6Pxk0ZjCnvkI6mCnQ+ox6Hp9zAzD+YvqCQrlbYdvyaU7JuxiJKD1rxjCMvDDYlssqOC7OPO
	1wm+pQ9EVFREyUrsV/F0zgG9GI/FY5OBYGUvkIDdy
X-Gm-Gg: AY/fxX5Z448ob3ftIVvAzWWasFiJInHGng9ciZc7EM2If1XySrgJBgI5W2qCwMNIWbZ
	Jywfyq2Jtrt2DcoOSAfue8uOdehJiXpfGYlr3HRKNx36KDbK8oj61o8DPJTic2yhA0QlUkiGRwg
	7eNGxxwR8QjvOfKS3FJE69oT6UHaFqMrWmSmqed+bK4NLQdeOXcbsNpNATZT3BZpmY9iOi5LVv/
	40ANF9M10kAFBMyuRkRJ/raQcBlD8Mn3mqRpzlTsGW4t91qDO9u/PORbXUfSMeROW/PQ/gm
X-Google-Smtp-Source: AGHT+IHQZSg6M95QOY20LVJ+U6afN9vq0F52P0HWtOJLySrzPLURQ1mpJ3LfAN24S8HXp6+itIFeZgIa0qPjDBLrpBc=
X-Received: by 2002:a05:6871:8a4:b0:3e8:915b:41fb with SMTP id
 586e51a60fabf-3f544024ee6mr4507614fac.41.1765295510714; Tue, 09 Dec 2025
 07:51:50 -0800 (PST)
MIME-Version: 1.0
References: <SA1PR10MB5885A090DB0B9F373F6A84F6DEA2A@SA1PR10MB5885.namprd10.prod.outlook.com>
 <20251208182626.GH11121@denix.org> <69524.1765261824486362826@lists.yoctoproject.org>
 <CA672035-3F4E-4E29-8E5D-4092AB95D129@arm.com>
In-Reply-To: <CA672035-3F4E-4E29-8E5D-4092AB95D129@arm.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 9 Dec 2025 10:51:38 -0500
X-Gm-Features: AQt7F2rq7rHQuME2TcffJdN7YHFvd7mE_2kjQVXdpBjG441d55yWPKIe8bo5-OM
Message-ID: <CAPoiz9xKnvSsTwROheUG=Cfp-yE1LE5_Y7e+FeKde0xzY7W5cA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/fvp-base-a-aem: update to 11.30.27
To: ross.burton@arm.com
Cc: Mohammed Javith Akthar M <mohammedjavitham@ami.com>, 
	"meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Dec 2025 15:51:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6791

On Tue, Dec 9, 2025 at 10:28=E2=80=AFAM Ross Burton via lists.yoctoproject.=
org
<ross.burton=3Darm.com@lists.yoctoproject.org> wrote:
>
> On 9 Dec 2025, at 06:30, Mohammed Javith Akthar M via lists.yoctoproject.=
org <mohammedjavitham=3Dami.com@lists.yoctoproject.org> wrote:
> >
> > Update Armv-A Base RevC AEM FVP to latest version
> >   Testing:
> >   Able to boot openbmc firmware in updated fvp
> > ./meta-arm/scripts/runfvp --console build/fvp/tmp/deploy/images/fvp/obm=
c-phosphor-image-fvp.fvpconf
> >   License-Update: checksum refreshed for third-party license texts; LIC=
ENSE families unchanged.
> >   Signed-off-by: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
>
> Thanks for the upgrade, but this breaks our testing. If you run testimage=
 on fvp-base then the test_fvp test case fails:
>
> hwclock: select() to /dev/rtc0 to wait for clock tick timed out
>
> I=E2=80=99ve not yet dug into why this happens, but it=E2=80=99s a blocke=
r to merging.

The issue is 100% reproducible.  You can see it in my CI at
https://gitlab.com/jonmason00/meta-arm/-/jobs/12280884125
If you are using kas, all you need to do is run:
$ kas build ci/fvp-base.yml:ci/testimage.yml

Thanks,
Jon


>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6790): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6790
> Mute This Topic: https://lists.yoctoproject.org/mt/116673226/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

