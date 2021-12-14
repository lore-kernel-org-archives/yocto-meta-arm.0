Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02604C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 04:36:25 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.21819.1639456584471616781
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Egm34WOd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id i13so16398557qvm.1
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EHHWspj4veLKDgGBtItmBFJ0OyGy1sSqgtnfZrum3EU=;
        b=Egm34WOdgNwEeRGko1h6+soZ+ClRJ2WGwwhMutoJtyOoO7/VbAtIhqPOfr0ZX8wazj
         QhpYLUmkJB1LcKaqCd3NHJ4AADV4z4mXbpeyNztRgoQhjLcLSA1kLzlBH9Y5UJA2vHGe
         vh5GXbB/elKK+9CiWJ/5zX/jttoVsJHt0g1m35bpMe6miG4OihNkve+EUeeL9Nb39vQF
         z7Dt6VF+oounfRPdZ4faJfkSe7HHRSUl/uJOetSFPeXLy9hhHpCrIH4debSjQWiTX0Ok
         eqcNvtcFb2wqkNHyOAN/5G0C1943UKlXzk4GyDGlYfEYFSk1LswHLffVWBAL6wixvQFP
         Q1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EHHWspj4veLKDgGBtItmBFJ0OyGy1sSqgtnfZrum3EU=;
        b=MDvIx7yVxtFQJLQCvda5BJH2NLYN/1mmYt00iAGZex55nhs6gDHK3ZZRq6YBqGoDbM
         OogYO88QnKXbLmiat/U6cOd6VTN8jz6V5eIqZVh+0bs96TH4wR2zuq305gDnTQnCzVTd
         RoIyNJ8ZTEy3zgZt92rhCvVCrPWQOZzjXn+TtmYQpr3byD33mPutx0EUJ0ToDDLx+e8Z
         2QGu+s9tTjhkFtVnSeYkzgtmhDGkLfPLsOczWfcbQ77hnT2PZuVHyIqhoTOSlqQPVTBN
         nv1buqHyqircYz5HNoajKe4BaODUpZ/EuJpHmKg2OJzz4zm5VPsqtImhoDxaZeZYZThY
         dgBg==
X-Gm-Message-State: AOAM530XcyhyHwIAEl8h3qEoq+eqSdeCifb9mTDvRE1AzI4SgokEMyib
	SRoEZ42SY6/ACZptCNPU0fz5wyMKTARG5u2G
X-Google-Smtp-Source: 
 ABdhPJwOgGk5L5V9gOvoAsIWMHf9dH/f9L4j+JukiLZt8uansqzuICAAdj3T0Ai9dUzghGg0HyxbZw==
X-Received: by 2002:ad4:4ae6:: with SMTP id cp6mr3017019qvb.108.1639456583580;
        Mon, 13 Dec 2021 20:36:23 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:d1ff:1ef4:15c8:ccc1])
        by smtp.gmail.com with ESMTPSA id
 u16sm4187891qke.127.2021.12.13.20.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 20:36:23 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/6] corstone1000: psa-arch-tests
Date: Mon, 13 Dec 2021 23:33:37 -0500
Message-Id: <163945641994.7376.7125451421522944925.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
References: <20211213162610.31273-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 04:36:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2673

On Mon, 13 Dec 2021 16:26:04 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> - psa-arch-tests support
> - Fixes on kas, TF-M and secure-partitions
> 
> Abdellatif El Khlifi (5):
>   arm/secure-partitions: remove the use of EXTRA_OEMAKE
>   arm/psa-arch-tests: introduce the recipe
>   kas: corstone1000: update meta-arm-image SHA
>   kas: corstone1000: update for new Kas include semantics in kas folder
>   arm-bsp/trusted-firmware-m: corstone1000: set SRCREV_FORMAT
> 
> [...]

Applied, thanks!

[1/6] arm/secure-partitions: remove the use of EXTRA_OEMAKE
      commit: a68fa362d2349111801d170847e423301cbc21dc
[2/6] arm/psa-arch-tests: introduce the recipe
      commit: 0acbf59a8e6cde6ba3fc92a9f040340162d41b41
[3/6] arm-bsp/psa-arch-tests: corstone1000: build the test applications
      commit: a56fdf433329c25c898cf884a3567a0dfbfdf040
[4/6] kas: corstone1000: update meta-arm-image SHA
      commit: 1e3cea589d24397fd084c3218a5402569405b222
[5/6] kas: corstone1000: update for new Kas include semantics in kas folder
      commit: 42347ebaa2e121f9e5c6b796d18222aa58792a27
[6/6] arm-bsp/trusted-firmware-m: corstone1000: set SRCREV_FORMAT
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

