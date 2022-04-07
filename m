Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2620C4708E
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.8218.1649344790387888303
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 08:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=al5q55EC;
 spf=pass (domain: burtonini.com, ip: 209.85.128.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f53.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso3874332wmz.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VcqnnfUk5uwFT7Qayu7IHmKcPZSvcVx1/b3mejKwKsI=;
        b=al5q55ECAr65xAvoP/FnxyYQV4GWvn2aHpj79Dqs2gYs+Nx+5fbPtObw+l8SDLY2ZQ
         0gPUdTPUK/UwQu3826bXvjGxoFml3xEiFeRq/DuaCdY4kNnHq4pQJIl/lwea0dnp7GPR
         wermpJTqh4VzsgX/R5DaGs7bhhV19gVaFqw6KC7pqkykvUqNUPmXDuVvey11m1oPsG9j
         6MXBU3zvJt8Hfmiifi5xrjRRz9I/BzqpiYBumY0aibxMktfKBkBOOkr2jrjj6mJANfgT
         W1aB8f0Xl5pQS1jIXgk/1Qglz05KHQ4WFX5+qGOnY/9pYqIbcVRiyeX1GVR/04kffA6J
         PzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VcqnnfUk5uwFT7Qayu7IHmKcPZSvcVx1/b3mejKwKsI=;
        b=IzssMtRxI6rgCWrMH+WCi4PVFdk0mkyPGLhB+sT0U/cLIBYYryvqeEc08wmYc8Obad
         FXu4aIMYpuEc6fxdAdEXZEa5PLhHo7olJeF5QHo7W8p7vWs/T5MihqSA4ZXw7EQj3Ts7
         BNxTTifBJTMiSSGo8HehO9vF+MUNBbyeeATlUC9sFzMWHefM+DkSo9KgIqgc9OA9vkpI
         uOt093o53A4Aw0cAgbqqsFsLwv/bDbQ2kFSIfeAFm8riwD9PuBF+q9kB7zNR0ZnZWY5w
         AP4qmep1ImPkTYemYB06Q3YzzONUMGMxDCgjrwBMvpgXCfJgCL/L9Wb6w5wKTgap3VEq
         +dSw==
X-Gm-Message-State: AOAM530ESnD14Jg4+OunkxAVFK5myc6pZbdKMAqRqYSuwspCRZnVjjuA
	Z0Cl5P0TMu6KyN0fvFkDpEmWBJ/VbFuDbNuA5KRY3w==
X-Google-Smtp-Source: 
 ABdhPJwdDVo5P2qEf7oCp/1s485RZ0/+wM7wIoc/QZTidMEGM1LRIXlz9K3XYJrpUchGhsGVXw/4X1gi3np4LLdQTog=
X-Received: by 2002:a1c:f207:0:b0:38e:9aac:df41 with SMTP id
 s7-20020a1cf207000000b0038e9aacdf41mr1576614wmc.14.1649344788682; Thu, 07 Apr
 2022 08:19:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANp-EDaiKQQpeKqB_tXek5+3arUHn0vm6-DhQ-=QBKxP9+PSwQ@mail.gmail.com>
In-Reply-To: 
 <CANp-EDaiKQQpeKqB_tXek5+3arUHn0vm6-DhQ-=QBKxP9+PSwQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 7 Apr 2022 16:19:37 +0100
Message-ID: 
 <CAAnfSTvbnpbe5a=KdTxXiw1F0F8-jtKufSc2WzW5bCUQ3iGR0g@mail.gmail.com>
Subject: Re: [meta-arm] CVE exclusions for dunfell
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3251

Yes, but they'll need to go into master first.

Ross

On Thu, 7 Apr 2022 at 16:14, Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> I'm currently carrying (via local .bbappend) exclusions for the following CVEs.
>
> CVE-2019-15847
> - bug applies to POWER9 backend, no effect on ARM
>
> CVE-2021-37322
> - the NVD reports this against gcc and binutils, but bug in in
> binutills (old version)
> - the CVE is ignored in dunfell poky [1]
>
> [1] https://git.yoctoproject.org/poky/commit/?h=dunfell&id=22767ef3986a7ac90e7c566ed38044d298a20895
>
> Would these be acceptable to go into meta-arm layer (dunfell branch)?
> I can prepare patch(es).
>
> Thanks,
> Ralph
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3249): https://lists.yoctoproject.org/g/meta-arm/message/3249
> Mute This Topic: https://lists.yoctoproject.org/mt/90315145/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

