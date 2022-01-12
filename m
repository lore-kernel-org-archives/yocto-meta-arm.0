Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED12CC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:55:29 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.25238.1642002928931496547
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 07:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=PXKcGy1V;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id 193so2234129qkh.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 07:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v15gKHJeV5s6i30s8XhFQOs0Ad2e5sWi5p0HzdfmzP4=;
        b=PXKcGy1V3CQUme0KYx0nAsOhZ9LLdKuydpc7Ltks0flX6JpUvFZkXyiq2czJRv+NNF
         Y5gQbpqn8YXAJrkOrojIDA9R9YxPSRXhZmRMorEOAh3CDjiZyBR878W8S+bFJEJ//x3U
         VVQOHSwvK77GsveqjsBsjiwetSvrbxKaKu+qtFcd5MjLFWwnShmEN/IUhWuWOmV9Ubqv
         NrF4gndiVnvVDExYvvBruqAY2XEsNrjjAvNd4QbwMZrVGIILepfWOzc9Jdnsp7QQKN7t
         +QS/LoO2ZU+19UcTkQJPVWCg3ZkTB65ndKq/4U93qfgdVPyp0eV7UJKddvVrLG3p6oyk
         7l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v15gKHJeV5s6i30s8XhFQOs0Ad2e5sWi5p0HzdfmzP4=;
        b=rMfjxKw0lJhLtILDMKnx4qKhMhRDFOy4JCkT8IO/nP6I5ZMm4W9aQJE3+Y+gHA6jhg
         aJxNPzUB+ZO6jUL6ub79FPG7eGLUb6kDnA8filu5LsWlnGJZELCE44lb2AjI2mbc+FRV
         I4ya1SjVnuh1hgp59lza6BueFmlrJEvEI0hOtFS7381ZB8nwAAG2El99NMlNs/7G+Z28
         4tsadkPVv/372npvKegPDlgVwQ5iEMIsPDTDiCIKAFj88HL+Dd0LP9wu7mjeAvOWEJ7I
         8Bnb21RouVlTnkS3gugRteeaVFj/HcKSZFioGKf8rEXCoYhKcC7/J7pQSnWJ1Me/Hxv8
         MAAw==
X-Gm-Message-State: AOAM533/ubRpR5X3t0W9vhRPa9miCdvt93HFUc/2XvZbu/OduT1sbpKs
	E0dgtyesBatTK0ipv20PTEe9+4ir/7/NPg==
X-Google-Smtp-Source: 
 ABdhPJz7sgaafbBnM0k6lBIsg2C63rROKdaEZ03HSyKa98NizkINNADuqsA0jm2HolS15WM0mhRpyg==
X-Received: by 2002:a05:620a:15ac:: with SMTP id
 f12mr235341qkk.343.1642002927962;
        Wed, 12 Jan 2022 07:55:27 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:584a:a7c3:657e:d1c5])
        by smtp.gmail.com with ESMTPSA id m1sm109734qtk.34.2022.01.12.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 07:55:27 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-a: remove TF-A 2.5
Date: Wed, 12 Jan 2022 10:55:07 -0500
Message-Id: <164200290693.3080473.3854230964560221693.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220111183030.3219939-1-ross.burton@arm.com>
References: <20220111183030.3219939-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 12 Jan 2022 15:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2826

On Tue, 11 Jan 2022 18:30:30 +0000, Ross Burton wrote:
> Nothing is using TF-A 2.5 anymore, so remove the recipe.

Applied, thanks!

[1/1] arm/trusted-firmware-a: remove TF-A 2.5
      commit: 0d2a9f6640c9fd509f6cac989683dc7d52349ff1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

