Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A68810ED670
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:53:59 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72452.1774616030696049230
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Mar 2026 05:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ZzCJqp3N;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.54, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d750eeaec3so932140a34.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Mar 2026 05:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774616030; cv=none;
        d=google.com; s=arc-20240605;
        b=d9bPYziyGdhosASVSEW3eVvyJEBB/PRKYzd+OVEAcTUec16J7UINcM6mRzFmWFoRMX
         0wvQKaJdIMb0fnAM/HM7RScMuR1plVoalq2hpi/nDY4GmH/qeM4rSOv+5KQswzsnEFJl
         1lr6A8mfux2bsXXl3PJVhgtU5r/KmvOt8qUUHKJZEkS0E9eTqA+xnW9YIKj8txAr5ptW
         cuQcJQJNt75+wuQUijZCOrVX8Yjam7G8Ae+aKe0pX3lWryc+mFKJUpQ7szEEcsOk0lS8
         VCjSnXrdg/WTrLP3setgKa5pnFhFwrzuhNQDQUBcOTY3QPoeA+vHJmKzGTptecNoyzIY
         aZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UOHd4I+5P2NYXaM6aFIkNWYQu8XB41GYgvE7XrzHuAg=;
        fh=DSUzeO8MU0oqOyXyeFeMSsMR+MJeCNYmX0KwXcT+jUY=;
        b=GHgZuk3gra2xuJq1gql29t3h9+irVniiRgH+TLwPwF1AWCeK2o8biPUy4L/u8ZI20N
         JjjILVUjRpD3VmLFVvYgj7m8Nt3a3rGrtk8IshW4ei4kQjBWZbxqz/2GVLlBsWUMvqw6
         IJhKdaToYIuITC4FXtWLcPvHorCOi3UX8iwmNDYZWMJWB2wyrVPgqq9QF893xx3CrfYX
         23iVxMcmMOGGDoCtTtDSIHunZQyZIzUEydvDy3vjH9SddW9HM6qKHmbqiuycsWO2Jj0E
         UsylnlxPRmEJQ2YMzaBVC1TfP8YHUaGZBj1UGUVc510llT8qRvEjqIGBb23+0ToBbczz
         ledg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1774616030; x=1775220830; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOHd4I+5P2NYXaM6aFIkNWYQu8XB41GYgvE7XrzHuAg=;
        b=ZzCJqp3NvBA8oLHeQVzesbwS11Fe9MBAgJaT23ZmWVEkIrj7cGpmQkDeRroWts+Y8S
         +L36HteMEmr3KYRUu7n1J8eK2ExVi4LuYhOhX770voSLCfyLtwnhW7ylT8D5SToORjCo
         lAHQ7x1d/r2TaK3n0B9lc0WDhasNsfNW+Wj7hzDahynqqbmBCK6u0w2QfGVTBTuwC13q
         Ne2nESwsq1sRejcwbaEcUbWm8mQ8XP1rOl4r33LD1EKjl+I+HaGbhBXKQCIpv+MOW5W5
         7UBdZaRXtfU7Zg3FLXjMWIUsGLwo/eHXYJoNv2vtQPoVfQ3xSgdAhF4lXNl+0Uprjko7
         Krjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616030; x=1775220830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UOHd4I+5P2NYXaM6aFIkNWYQu8XB41GYgvE7XrzHuAg=;
        b=IK2psShImEM6YM/5C3+e4E8DhLGaDjTxsFnL4eAiDJx6Pq/91BS5qjx9me6DHLGCjH
         PzJbj4z0UrBap1W+18uDqpb4jbmxRZSiU7vZ3kX1ySzxx7IigkLuv6k0C8njSVXY9dzv
         ybjUtfz6hPM759SF4EKtbwJDmq5tSP3YpnEzWQ2JiNJZvDUwLoa9zDiIswaIXV3Zx7H+
         zauKvMOFCPN+sC21DC6vLkJ1YTh0xrUCYqeSFEmivkLVosoH7yFQ3aYw+HJNMAZ9D+d1
         d+nO3QiXK9epUXztbSAhFHbFTTwjvGTFJV82sa93J+KRW/0LfNW53narNVuvR+AcJT4R
         vHBA==
X-Gm-Message-State: AOJu0YyaXsdJ89NSVl1yTWH5bbYofwqmbDLFPnjgzml1IYmoZeemI8PV
	tV4lKVt/Mx1t/G6RnqnTfAm3oKKgwPmtnKtagsE9FHmN4g85eIPKJwJLSLKV1jGamvsBNUrg0zm
	oe0ZBsPHuQCpHbOCtZ3DiOViJsPdYWX5eR6dRD7rm
X-Gm-Gg: ATEYQzyqLWSODFDb29eizhW2LaNLMnO+zxOKdPCGWjKo4aO38axCzpX9HzoG2SZGaYv
	iGnFXIAT2kJqalz82Ww3ziO32eIwLcyTfJ4iBWxLtpK/ggqWEg/dcfjWH18vnBnFQ1q9KdXyNHT
	PirH/tvDRKu9hzbiL3tgMQknItaBdiqaIsayYbZ+OYQgM+Gb++aYO1KPl78GjXV4JRk14nZSBfC
	6gnA3rZTB5rVH+RL82qCzzP2Xo6XO4EU924p7j+BmsqjA9PocfJwV0xpsDEOjuobYjE7QEIy01+
	WCcGyfQlDQ==
X-Received: by 2002:a05:6830:3809:b0:7d9:f582:cb6d with SMTP id
 46e09a7af769-7d9fad8acd2mr1048914a34.6.1774616029896; Fri, 27 Mar 2026
 05:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <DH7ZEAMDKDZ2.3W0SJDQU59IXK@smile.fr> <DHB2UT9U65ZR.1A4WRTWWUTYG8@smile.fr>
In-Reply-To: <DHB2UT9U65ZR.1A4WRTWWUTYG8@smile.fr>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 27 Mar 2026 08:53:38 -0400
X-Gm-Features: AQROBzDTIY3ABhQdGy0V16SM85Ie-hKUmNn0cPBE5XaQLoNt6Qpo_pvR2IgBcqI
Message-ID: <CAPoiz9wHEKfkv7jwphR8K+kVBNEhgMf_GpLFHnTvd8MOj2zOug@mail.gmail.com>
Subject: Re: [meta-arm] AB-INT failure in whinlatter/edk2-firmware do_compile
To: yoann.congal@smile.fr
Cc: meta-arm ML <meta-arm@lists.yoctoproject.org>, Jon Mason <jon.mason@arm.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Mar 2026 12:53:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6979

Sorrying, I just noticed this yesterday.  I tested and pushed it in
https://git.yoctoproject.org/meta-arm/commit/?h=3Dwhinlatter&id=3D4dc2a7bf2=
9c1853b95dda53d9527f0a23049295f

Let me know if you are still having issues.

Thanks,
Jon

On Tue, Mar 24, 2026 at 10:21=E2=80=AFAM Yoann Congal via
lists.yoctoproject.org <yoann.congal=3Dsmile.fr@lists.yoctoproject.org>
wrote:
>
> On Sat Mar 21, 2026 at 12:00 AM CET, Yoann Congal wrote:
> > Hello,
> >
> > While testing my whinlatter branch in
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/75/builds/330=
1
> > Worker: ubuntu2510-vk-1
> > ... I got a build failure coming from edk2-firmware:
> > | make[3]: Entering directory '/srv/pokybuild/yocto-worker/meta-arm/bui=
ld/build/tmp/work/sbsa_ref-poky-linux/edk2-firmware/202408/sources/edk2/Bas=
eTools/Source/C/VfrCompile/Pccts/antlr'
> > | gcc  -c -O -I. -I../support/set -I../h -DUSER_ZZSYN  -DZZLEXBUFSIZE=
=3D65536  antlr.c -o antlr.o
> > | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D655=
36 -c dlg_p.c
> > | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D655=
36 -c dlg_a.c
> > | gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D655=
36 -c main.c
> > | main.c: In function =E2=80=98ProcessArgs=E2=80=99:
> > | main.c:163:42: error: too many arguments to function =E2=80=98p->proc=
ess=E2=80=99; expected 0, have 2
> > |   163 |                                         (*p->process)( *argv,=
 *(argv+1) );
> > |       |                                         ~^~~~~~~~~~~~  ~~~~~
> > | main.c:120:34: note: declared here
> > |   120 |                         WildFunc process;
> > |       |                                  ^~~~~~~
> >
> > It succedded when retried (same whinlatter commit, different worker:
> > debian12-vk-7)
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/3303
> >
> > Regards,
>
> Looks like "arm-bsp/edk2-firmware: fix build on newer hosts"[0] is
> needed for the whinlatter branch (On Ubuntu 25.10 GCC version is 15 by
> default [1])
> [0]: https://git.yoctoproject.org/meta-arm/commit/?id=3D3afd7461b1b4fd499=
0443df10dee30bee4eb6449
> [1]: https://documentation.ubuntu.com/ubuntu-for-developers/reference/ava=
ilability/gcc/
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6968): https://lists.yoctoproject.org/g/meta-arm/mess=
age/6968
> Mute This Topic: https://lists.yoctoproject.org/mt/118427086/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

