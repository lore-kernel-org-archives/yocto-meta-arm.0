Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F14EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:08:55 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.11261.1686748132467330197
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 06:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=FumPgsbg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3f9cf20da1dso18908821cf.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 06:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686748131; x=1689340131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdEF6xq544/uaZgwan4yDk1clQ70N91chRcALFgygCc=;
        b=FumPgsbg9H96SMvpoz2HkqOwAd47s/SARhD9YFhHaXnvK2EJkYjLdDG6ZaiYtN5biI
         a2NzvTZI9t5yzlkGptCT3OyoVjVKiMzvDszq0CedgslO5I8oCiaKroDOmDCaZdTZ5zko
         fBkHFMa7HcpTZVo6db6DSxVoUes6SW1t8DipXkBeU1fPwM7/2vBcVXy3iGR22TkMN2JY
         xStiWZbqF6SBz1o8y6tWVublihyUH/q49ZDvVJJjaWVyjrMWleTaL9vafvo2K0i2O8UQ
         EJpy8Szw3lSZei9jqN5UU/vEMsFWcG2+LX4TCEl428uukJtStdT9B1NtcyxwnoMNMXn5
         9Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686748131; x=1689340131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdEF6xq544/uaZgwan4yDk1clQ70N91chRcALFgygCc=;
        b=AI87FJ4+cH7l7d2Uigj52XNGNt1DZ0B+KlEHrWrxxXLFr9Zss/v5ZqhYKP47DsZdRi
         Ia9vDCpxqakvVDAkgsc7FNNYPPGETHB/jx5jXQIG0YPXK+eccnNkA4q5TJIpGyhBCZ+g
         egHiZFJ1h0II1r4OxL5NJ1M/1z3/re/tIzwVaomRSlbSN0FgyBCIntGwYRTulhIk5sMK
         IkmCLZI4D2DLF2aHcjhleGc9QQ4HxxbryNcQfPFWwLL5bqw++GgslQq79sdR2I4A0wv+
         9DGCbq0gxOEbEs5bOc7lq1rlzDHRNdH3PoFyz0//gwlbqvKFn1ON1Co7rJmtXwPQCe9x
         LleA==
X-Gm-Message-State: AC+VfDzdsdcIsoUf5MTsx1lVP4o6IUvGSq195yM9ziaClG2tOnwH2Ewj
	YtbUEbpUzT1DlrbZJBtQvN1zaPdD1ksKWpNr4Fc=
X-Google-Smtp-Source: ACHHUZ7oXtt/StJhzj2wHNouvvbABipAPUVPeXlSZqEGNb4Jh43+/raOkM7aqUvMdAoyRnf2tzov0w==
X-Received: by 2002:ac8:5a8b:0:b0:3f9:d1a3:8bd9 with SMTP id c11-20020ac85a8b000000b003f9d1a38bd9mr2653681qtc.9.1686748131111;
        Wed, 14 Jun 2023 06:08:51 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g12-20020ac87f4c000000b003e39106bdb2sm2705417qtk.31.2023.06.14.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:08:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [PATCH] optee-os: do not explicitly set CFG_MAP_EXT_DT_SECURE=y
Date: Wed, 14 Jun 2023 09:08:01 -0400
Message-Id: <168674808553.2420450.14762329327317252517.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230613181723.1711212-1-denis@denix.org>
References: <20230613181723.1711212-1-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Jun 2023 13:08:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4779

On Tue, 13 Jun 2023 18:17:23 +0000, Denys Dmytriyenko wrote:
> CFG_MAP_EXT_DT_SECURE=y should be set per platform, as it requires CFG_DT=y
> to also be set, which is not the case for all the platforms out there using
> optee-os. Moreover CFG_MAP_EXT_DT_SECURE is already being set conditionally
> in optee-os-ts.

Applied, thanks!

[1/1] optee-os: do not explicitly set CFG_MAP_EXT_DT_SECURE=y
      commit: 0943562aa045d80fe9b613d91db1e6b874bb6944

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

