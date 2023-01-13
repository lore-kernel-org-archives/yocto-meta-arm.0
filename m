Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A69C54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:06:17 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.95614.1673633174726354791
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:06:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=EfgbQyhc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id bp44so19795222qtb.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqmSF1S1TPYISjiKe+9UGGm+pooI7DKas7/eX5901Lw=;
        b=EfgbQyhcaovVB2LlA9oFsvlmayOudnbjiac/bLtgSGa1Qd6Z+IibJwAnEwBODWUSiB
         epS71qRamy5pksEDPrNAVUIh0w+w8WJ+EvRKw6lhUX+6PHYFbA+dqXVe6QaJzx4Tstgh
         q3vTtbnwyYKC40lkL0O6yFR1Gr6bTRd9yDIMYyK4VExp+CoYR0Iy1hBBzywBEr+Aefcv
         KYJ9qN9EChuqJMmUkYEeGPrlnDJC2mukAPA0VwtSOHtv9Y+h0A+0mxebfLxEpg/iWYXs
         ft4vz+jFZHNrUxgkT9mEBhDqyFAd+3ugWnAHe1Eigg7VR251+mqaZ0JVGnbUZ6Ufcz9C
         P1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqmSF1S1TPYISjiKe+9UGGm+pooI7DKas7/eX5901Lw=;
        b=6BzorvyGV8rezddMh9iWwYz8YdSFilQ4y6P+RiLxJZKm79PkHO8Dtw9QY4pQREm+86
         bdTV5cIp2WjRiwgTV1oyO07Q6wZNcAKqolVNdJhAsUDYsXwvr28BodU4IfHIvvp9SHGN
         khLcbXvKaWRitfi7BgJ5Uc6jwU8aW4Ej7KMJVzgBAADgFZVW2CevAC2JA7dvmlg2mc2O
         Tayt0lhwQ9zyANk9A7rAE6KxX3CeW0VaxHDC6B2XN2HcNZHa7cEDYvfGQ5GUZ4fXK1Yt
         rAF8T06DNOSfjMX233ybjfn1/4hlJjXmOSX303MrLXSfICBNuWGYppPsMV7uv2ejilXi
         sOsA==
X-Gm-Message-State: AFqh2koEWFnVP5JSDbOZ+owhmRJdkfIV8C7mJPs2QyLyu/XJMjazvghK
	Tw/+TTCCoUgfoRJopO77kxDnNzGRr1vj7aI2ODk=
X-Google-Smtp-Source: AMrXdXsyBPqjlpVgeuizLFu6LuQcTfPK6PBugC5IPN5B5QsFYfAfwsLjObmzudTCIwLGWbtomrg57w==
X-Received: by 2002:ac8:44cd:0:b0:3b2:c738:88a4 with SMTP id b13-20020ac844cd000000b003b2c73888a4mr4664993qto.18.1673633173438;
        Fri, 13 Jan 2023 10:06:13 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id g20-20020ac84814000000b003a97a71c906sm10847757qtq.78.2023.01.13.10.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:06:12 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"Theodore A. Roth" <troth@openavr.org>
Cc: Ross.Burton@arm.com,
	jdmason@kudzu.us,
	"Theodore A . Roth" <theodore_roth@trimble.com>,
	Emekcan.Aras@arm.com
Subject: Re: [PATCH] arm/optee-os: Fix FILESEXTRAPATHS
Date: Fri, 13 Jan 2023 13:05:49 -0500
Message-Id: <167363314944.1009004.8073767032802328551.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110170627.10991-1-troth@openavr.org>
References: <20230110170627.10991-1-troth@openavr.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:06:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4288

On Tue, 10 Jan 2023 10:06:27 -0700, Theodore A. Roth wrote:
> The include file should be pointing to `optee-os-3.19.0` instead of
> `optee-os-3_19` (which does not exist).

Applied, thanks!

[1/1] arm/optee-os: Fix FILESEXTRAPATHS
      commit: 393e37c90e2d7fff077211cadf6fe973f4e33529

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

