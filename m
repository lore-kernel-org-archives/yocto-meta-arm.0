Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2265C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 20:06:24 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.747.1669061180457141654
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 21 Nov 2022 12:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=bK37DXQM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id fz10so8009371qtb.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 12:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mtRv8pOOYamhit2EzqYByylVz8EiPIbztLz89xiA0E=;
        b=bK37DXQM67G5JTn6JnDSr/MDBoGnh7qJBjEADL3rMikgL8C/uqeNw2jLXB+nMK9OoD
         CA92PllyLl0vlkwhIC1LQHJfuWC+JsABZFV2+08vJsFzPUDs1np6F8w/hds0oCBXqc+9
         DA9vUfzTGiFqPTepXmPBB9YIwQYDNGYWiLbAvp+MLUE6SAumesFJ+ks/c50dKgVqV/49
         kVGuEDQ8di4dVTwB1ucP8/oCyb0WU1yrFyMk/OPqdpmBAkNp7Lct7n4DGl7eyBRN/Zqq
         3FsvQ/DIE9XGXYy/U/YU+puvC8+Lz/c+W7Rz/RVb3Et8xKN3EJ0zCtkU5diKWQw90sVy
         3b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mtRv8pOOYamhit2EzqYByylVz8EiPIbztLz89xiA0E=;
        b=r85Bm/pgi8RxhhjjouKUWt3/4eNMepdNfEBKzBmcR0wsf546Z+jacXFEgueDNPEL+j
         erzjqr4s/wQdeW7vov8mu91vHC/grgiNABPq4QwHtpgv0ll39PtVb0DWwg0lLjz5DSEc
         2UBwhNr2Va8r2kwfYRXhUPOA4GOm39YHIXlCWcj9oRK2RRXYiydRbMel+LriDzDLW+zI
         WvPZomGnRHSnS8XeWD+T72euyenRXtbdn0TyrMFt+QKYmy6rlIzoFZ0OD0wr3MEbnDDS
         Udie8K9OSdzIy3GJ+5y0fBj72oObkErRNSFFpOY5SBRmBe19yj0J0wXAM4YNMhFLrfpD
         ofag==
X-Gm-Message-State: ANoB5pkLMXznL03yD3UC9SR/t3YzbSSz7RcvlGHxBM0i49xKeWA/JEnX
	qVrZzh5g0PNn5CQy5RPMJ87Z8lM9OtxYyA==
X-Google-Smtp-Source: AA0mqf7D1ZM9L1YkanzSY4JVPgyTv2C2X6r2Eudn8MFF7UPJPBMXbalcjX7i0jDAo8n98oyMT4KDEA==
X-Received: by 2002:ac8:4b6d:0:b0:3a5:1ea1:b7df with SMTP id g13-20020ac84b6d000000b003a51ea1b7dfmr1103725qts.549.1669061179100;
        Mon, 21 Nov 2022 12:06:19 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id bl3-20020a05620a1a8300b006fae7e6204bsm8996720qkb.108.2022.11.21.12.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 12:06:18 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	David Bagonyi <david.bagonyi@gmail.com>
Subject: Re: [PATCH] meta-arm-toolchain: Drop calls to datastore finalize
Date: Mon, 21 Nov 2022 15:00:46 -0500
Message-Id: <166906085078.3764609.1744379340716169376.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221118120104.21419-1-david.bagonyi@gmail.com>
References: <20221118120104.21419-1-david.bagonyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 21 Nov 2022 20:06:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4150

On Fri, 18 Nov 2022 12:01:04 +0000, David Bagonyi wrote:
> In d8e9ee8fd53b7620e72b2dfebb2e8d464b737dbb the finalize method was removed.

Applied, thanks!

[1/1] meta-arm-toolchain: Drop calls to datastore finalize
      commit: 23aed71692cf38c0e244cb837ef07a9cf19551c2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

