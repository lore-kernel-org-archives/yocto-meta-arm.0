Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887DAC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:37:13 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.13675.1644338232358496532
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 08:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=ccB3rdcQ;
 spf=pass (domain: burtonini.com, ip: 209.85.160.169,
 mailfrom: ross@burtonini.com)
Received: by mail-qt1-f169.google.com with SMTP id b5so15148727qtq.11
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Feb 2022 08:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gQ92oG9+pNPoVWpFcTH8LezN5N3ful1Dj4JsDlbPMeo=;
        b=ccB3rdcQBJa/5YYFuEIS0lY24PBnxKy1aezXiM8Wiq2jNmWKtexFxQ8XmPpHVkILLm
         DA58iZy5fcnhe6OaZCGcRrdlu2GcjisttBxKQnbejTMBA8FCxjVJ03EZkZpolFXEcE7s
         +OZs/mYqe8sE+h9zU2cXyTr6Wuq1Zaue5nG4TaPvt/YJOj9UVQkwEOrwvuLyHOweJ3G9
         GMHxzNqEwlo6c/xwjwd/qdtWLypUnhTckKBpFNcfqXwdWv350ytVUyjjWjcScM5MhI4r
         7pvJudTXI0bvdJlJmNu9Oc6LqLxUPrLsFkyH2fY1oiPcVxJUte4KEexvMhtNGB8Xn7To
         GCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gQ92oG9+pNPoVWpFcTH8LezN5N3ful1Dj4JsDlbPMeo=;
        b=hY7ThKM2haVuVmpgujIgU4OsP9VmWa64wpwUhQfU1f3y5SJALV7QPbdmIe6WIOYOCb
         wQAeRercQKqtQpHQhC6j8XtAffMIRUCJzsiiD7g9NRhpTwQs0Z5JsLS9H8jQ1354jskw
         32gLDGg3quC+X+90CKWZmXHSRtJ49nzi5qTyfF5mfZR1s4bEMDfto4QDiz3D+lN6Hliz
         sYBbJcK0FdsRaWowMMlvM+vMnzkIp1/Xhyk/rsuWzxG1nfsLnB3CtRwUtS9pF7ULdB7q
         aYEbo/J3sGJpP1jSRg0mFdClA475wY7ilyFR6Sqg7dwOKapS7jJv7ikWrCYHWIwNa/WN
         lOcg==
X-Gm-Message-State: AOAM532rY58+Y7LocO1VwlFSzalE72EgcgB7t4Xd28e1Nq+WtZbQGW2J
	JvZvl3hZwmq4Lfz688RmPME38jm5uHFBifu4Atn3xw==
X-Google-Smtp-Source: 
 ABdhPJzUN8+sYTZ1GXpCVakQ6jvjv7vQObCg76bdtYixJ9ZZHbj6cKnJtx7fWBp0HsfVs51/U09m+piu/Oksgkm4ldQ=
X-Received: by 2002:ac8:59c6:: with SMTP id f6mr3498395qtf.343.1644338231290;
 Tue, 08 Feb 2022 08:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20220202055225.2212857-1-raj.khem@gmail.com>
 <CAAnfSTvV1rZ2HjurBJqxOYSBmA34npRdckDuXj8Dv0kfU0GaUw@mail.gmail.com>
 <CAMKF1sr=PMcRWpO3CPBjER9goDuLJKjqNiumGD04yQ1ijFyR6w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr=PMcRWpO3CPBjER9goDuLJKjqNiumGD04yQ1ijFyR6w@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 8 Feb 2022 16:37:00 +0000
Message-ID: 
 <CAAnfSTtNJuK5mUYAct6EcnEMdf3HO-GS3nhZQLeeWmOdSyWsgg@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] ffa-debugfs-mod: Do not build for rpi machines
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Feb 2022 16:37:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2955

On Tue, 8 Feb 2022 at 15:21, Khem Raj <raj.khem@gmail.com> wrote:
>> What failure did you get when building for RPi? I can't make it break
>> by building it for non-corstone machines.
>
> Build it for a BSP which does not use yocto reference kernel

Worked for our TC0 machine, which uses the Android Common Kernel.

What failure did you get when building for RPi?

Ross

