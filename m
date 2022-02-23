Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F179C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 11:24:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.6346.1645615483164314487
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 03:24:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=hMx1Tb1N;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id p9so39016396wra.12
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Feb 2022 03:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WduKUTGXbyHAP5PFVElwIGaMTO2zjFafRTW9rTyxZNA=;
        b=hMx1Tb1NKAo+LR7oNbnF1YS1bOP7IzjrsnkVKpiHCshIqKytGvhp6seFK1TZY3o6Mg
         080LuBIPwG3zsdNlk3kHX941Ljykb4+tQ8xeQ2QQIIudgu1y7v0RG4gIJ3Y79Ux1gYy4
         kevEa/Yjw8OV8ZyJlHwRDPzag7n+K1VbYnOwp+32j/Cz7kpjsBpCX7ZiC6khgga7217B
         cqaSkZi/e75OV+VUpZi0gjvC/vg10OMz6bs5LeXQ/ls2+KqDEovMSBmtZySaXrUGIGz4
         pVGCE27eJJsg9oy2luRfOtdsiEDisTZtzhh0a30ilazpH3l1nqc9VEEgWnjCjxZAlTAu
         HWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WduKUTGXbyHAP5PFVElwIGaMTO2zjFafRTW9rTyxZNA=;
        b=4PRLYDfCBf0wwFIsWvraWFzhJW0808nuVePjm55H9wCEy4bOeFaJyr3eo703QNcm7S
         RLnWiNtGhEtXks1C6JFnqiiFuTdOv70oNHAQKB68pp7GcX/JkOqDdoTxhuKhW5bRQI44
         b+K4T/LWUCyYdTNaTYOPVmSdixYCHDcNZPCz6qZidTBM6UlcSEjYbp383T6/sqeGH6J6
         8UIfENA8NfMqnf0dHdKZw/xR+zwGiCU0Y/HYYt7v1D/ii3TfMiYKDfaaysDD8AVkDKCD
         kRxUQAc9unr/ZN6h9LCGpaYx1GtrZFb6OD4FXazROa0PvHPlUnXg2o8eBlrvE8tfqdUl
         vDoQ==
X-Gm-Message-State: AOAM530sAcAWL99Vtkh9lr0oVktoX+r0srKVEckcgTf3Ay40Z/C0Goaj
	826srqZcd6P66l8L6+r1KptRMZLy/FNQLIYF6YnEcg==
X-Google-Smtp-Source: 
 ABdhPJwwa3oWIv5FPxSXeq2IU2a3/MozKrzam+gcjs/hDb6IpjMYuTKiqGb+TAOxVVQmFxd269UpOvBoHnpDTDx+jhA=
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr4779966wrs.620.1645615481415; Wed, 23
 Feb 2022 03:24:41 -0800 (PST)
MIME-Version: 1.0
References: <ZB4Z.1645606885290792386.NXh2@lists.yoctoproject.org>
In-Reply-To: <ZB4Z.1645606885290792386.NXh2@lists.yoctoproject.org>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 23 Feb 2022 11:24:30 +0000
Message-ID: 
 <CAAnfSTtDNzjpHm_DsKjokCD6KtozhMXQSp-DUWduZdJXz0ts5Q@mail.gmail.com>
Subject: Re: [meta-arm] Upstreaming GN recipe to meta-oe
To: robert.drab@huawei.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Feb 2022 11:24:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3043

On Wed, 23 Feb 2022 at 09:01, robert.drab via lists.yoctoproject.org
<robert.drab=huawei.com@lists.yoctoproject.org> wrote:
> I'm working on some GN related stuff for Oniro Project and I think it would be great if you could get meta-arm GN recipe upstreamed to meta-oe.
> There are already couple of layers re-implementing this recipe and I think we would all benefit from getting this to a common place.

The big problem with GN is that it doesn't make releases and it's
basically expected that the project ships its own copy of GN.  This
alone is an excellent reason to never use GN, in my opinion, so if
Oniro can use something else then I'd encourage you to do so. :)

I've written enough of a GN recipe so that we could built hafnium but
the long-term goal is for hafnium to move away from GN, so as soon as
that happens we'll be deleting the recipe in meta-arm.  You're welcome
to maintain a GN recipe in meta-oe (or oe-core, if there's enough
users): the recipe in meta-arm is a start but it's not finished for
sure: I've not tested target builds and nativesdk builds should work
but I've not tried those at all.

Ross

