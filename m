Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5798CC77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 13:41:24 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.49755.1685367683439155084
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 May 2023 06:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rGXSs1y6;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b03d3e41fcso49994391fa.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 May 2023 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685367681; x=1687959681;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Waxr4y9qrzAJvnGUb4QcHuDfNHvAN91dBXMzPAXGBrI=;
        b=rGXSs1y6HPrF+BuViF1teDpJJIpaonoHFS12dRajCwsBGTQciNWXhzi9JK4ctMupYJ
         1uHKsvr1PbkUCY8SzrjcFu0SYUbLeoC5Z2RrduHd8wYXaltCEUmFw7qKVF8/mYkUI3sj
         k/j3uFvnmD8feVreHwLao3kaxlBeAlkxLvylvauGnrGYuMB6QQCXdgmc3qzdvH//tMhq
         9JIThUArZIZGYZe7v0eQMp8TxAdU4rNECCg756LfxKIy/OBmXBo+Ke3BD4tV7ImMqwb1
         umLljdbMYU+dY/2f2JmoWUn/sV1aixnqt3dUH6O5pdjXpsgNTFxeDwraN8TxCyZPDk6/
         CIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685367681; x=1687959681;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Waxr4y9qrzAJvnGUb4QcHuDfNHvAN91dBXMzPAXGBrI=;
        b=RvMD088WitWLoAliCBU1xu7wkf2tTwAycrIYeB2h7pBv9oDOvY0rTCXZDzl5oCaFbF
         0nttRxP878qg5tCAHtKm/0z+IXepbrWetHX5kAfiTJL/Ck+EHRhJIBcHjBpf1caxH3lt
         02iOeqPJwIEIc2A8CSv7KbZyqzgf6sfEGgllyQjEqXb+FwAJZvxu7pRlfBl5CFVqSVV6
         xX/O5lNjkG/QOcrEjzoB/QLkIKefCt1RPHCHjrt3eFX+OMQe1qSVrvl6ys2i5iFNs8CC
         t+7N7tYvJQ//pv5/J/ELcByjyN4jl0Weo3moWmpHOtFqIGGUGQKv+0GbiDwRTh+Ds8J3
         iLpw==
X-Gm-Message-State: AC+VfDwBPDCBdFKEZrSu4e9zfY6NDN+5Ce7JbqRbfKrLjn08BDiL8NHs
	syUAm10XqedAwBS3AxIkkpFNFbasz0eT7M7FnYcOWE/jiwXP3w==
X-Google-Smtp-Source: ACHHUZ7c9nL/TxLLpt1cRB5glWHPj20vMNy70mITo8XKpaxZjIJy7hVmZfNSl3oDLvAw8/neZ2qmq7fr4GvEvZAW5Yo=
X-Received: by 2002:a2e:a48f:0:b0:2ad:c9cf:c32a with SMTP id
 h15-20020a2ea48f000000b002adc9cfc32amr3124831lji.23.1685367680770; Mon, 29
 May 2023 06:41:20 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 29 May 2023 15:41:09 +0200
Message-ID: <CAJiuCcdj20VWVHkAtiTB_VA9ENssbF_RmaWaxPNvBoPQC7MbNw@mail.gmail.com>
Subject: runFVP with FoundationModel
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 29 May 2023 13:41:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4713

Hi,

At the moment I'm running FVP with the Base Model (FVP_Base_RevC-2xAEMvA).

As I understand, the FoundationModel is much lighter and I would like
to test it.

I have tried to simply switch the FVP_EXE argument of my fvpconf to
"Foundation_Platform" but without success..

My machine inherits from "fvp-base" and as I understand it, it should
be both compatible with Foundation and Base model, right?

Before looking a bit deeper, is there any documentation of script that
could help me to run the FoundationModel?

Thanks for your help,
Regards,
Clement

