Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC10C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 18:24:14 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.829.1643048652797403401
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 10:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZJ0SB6o6;
 spf=pass (domain: burtonini.com, ip: 209.85.221.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f42.google.com with SMTP id i2so15240086wrb.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 10:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rvo11LhdtsfCzhfMUdOwIk0iSqx/SETgZleRZ0rCtF8=;
        b=ZJ0SB6o6x/qA+wrusdCx+VW0tniw1kvbaZ8zW2p4keJZwTtCq2TRDAWGlo/oLoemMs
         oXsQWOYc+Hx7x3Fys5qtTaC5n4RcKdx3fNjsxhrjss3bHCx3F12gZAuR7di7mx6Dogi8
         9AiWw20z/kX/E4SQ5cu8EqQrPOFsdul3N6thhqgPS20DgV04lysxWkZ5JwJ2KQsh2e4s
         9zRk/QzoGm5AGnpNSujqLGBqDfmAqMEzfo0g4TdnqhBimTPIPZdxOSAUjhX7D124s+Gm
         V+g4FwqqRppDysUYH46gTCEsUhzef62Jr+cyaAaC4hA6HbqCesRymE0n2jy7PPcS3lG3
         1Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rvo11LhdtsfCzhfMUdOwIk0iSqx/SETgZleRZ0rCtF8=;
        b=zP8HUFU/IkGzdxNeLypLt2YbEnR5T7S40vO9sG7YBnD7b0kEajWMmGI83oET9sxl6L
         S9+2hEEJ5WohiBseCz0hZx9FdT40ORxD7fH87v6o29zGFKXyABgorO+OyieH4jwIsHhL
         zdiPHl0zeZDw0LOtFrufWWyk+RuPuTRq229PaZaGiFuTmE2WFkjb/5Q+KUDJMTySBcPB
         KDL2upKgUELG56UAS0j+FGk9bC6sWBXrceLbImm0EkhLwoYbazp/T1MXzCFU6KofOOf2
         MV0RsYs1x5pxq2DscWlSJ1qoUZowfq0J3qoDd3sYSfyMRcqpds3e3Q5Od6spDb2M+/26
         DiTw==
X-Gm-Message-State: AOAM5312eezgbhz6WYCeOmS1yDgN/CL4vTImFx2aApS1jXhlDg9fRTyb
	v+nC+i1X9tOLp3CCNqBWf0z61e+JZe9DxwTU30caKQ==
X-Google-Smtp-Source: 
 ABdhPJzbNlLOUM3YfuJhWrGhrrYBxnsCHsswRqEHnzkXpaXZXU/18OH+moo3t0Fg4sOC83yei9BiX/oXHHcM9cxZ0w8=
X-Received: by 2002:a5d:59a7:: with SMTP id p7mr10609011wrr.620.1643048651255;
 Mon, 24 Jan 2022 10:24:11 -0800 (PST)
MIME-Version: 1.0
References: <20220124174012.3916927-1-ross.burton@arm.com>
 <20220124174012.3916927-2-ross.burton@arm.com>
 <20220124180627.GU26229@denix.org>
In-Reply-To: <20220124180627.GU26229@denix.org>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 24 Jan 2022 18:24:00 +0000
Message-ID: 
 <CAAnfSTuEHsqwBc=bz8x0jsjrGT-anPa=LYf1G4C8LKMcp974aw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 2/2] CI: fix check-layer indeterminism
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 18:24:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2905

On Mon, 24 Jan 2022 at 18:06, Denys Dmytriyenko <denis@denix.org> wrote:
> FWIW, I've fallen into this trap before - should this Sumo remnant be removed
> from Bitbake then?

No, the layer shouldn't be found in the first place.  I'm adding a
check to the tool so that if the layer searching goes a bit haywire
and finds these it aborts early instead of giving weird failures.

Ross

