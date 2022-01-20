Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD1DC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 03:50:23 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.7331.1642650622036606639
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 19:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=yfNtNuvj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id u26so5439696qva.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 19:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5nmXQ03fFycg0PFBSQHP+Mf/r3o+ZZkcftBh8j/nzdI=;
        b=yfNtNuvjwrNZzlgEUsBJgKeg4bxi5TChDvrGrRL+0a1PSOR3+AgelPUJTTGH5QJhDo
         1oANtURmGymkrJy/iKSQsY9V40SwXr+t4/RjczCw2wSIXqUHuK3q8OBuxE107zOypXfG
         6jFg3cpgP69IkEV/R6HJyxssiYvEhxdak+enJIYIsylJjHmOPZBmcxlp0STtGhnBPYgg
         Y/1VTk3MgaWXGcJwUAfRk6i8/yLM/rp66VCZBclwBYbMq2EByq+HWDxjYj9SmrNWP9sF
         RCvxMcfN9M81O/FGH+neketHlGZe4vOnJ0wuYp/bp4/gHkWmAi7yfwL5Ec36UyjebDLt
         brUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5nmXQ03fFycg0PFBSQHP+Mf/r3o+ZZkcftBh8j/nzdI=;
        b=nYMxSJKfzEswR0UvB2X7Ur+ZolPfLz5xq/DbVeQXsSj80C/1MuNnvf0X36hAHwj4VZ
         IniZZSeXFlvIj6/YlVI54+LEuObMEkDoI36cZzDQKdlAsUyZV3GF+/VAz49DRSk12HIi
         FmK0flAaPArm3AhJmmsl2EsouR9EkPlMTkCsRtJgtAeWtlTnUHl70jE1K/dFTEdKLp+P
         ThTVM3b3bAL788yotOUE9jeHVSgAkYbth+lDdIeKcXgQzfQV7rOT1J2SkzCXdmGbhmzk
         EI4QxgVzVS4DN+NOn4uqN9O6/J7YYEGsDv6TviYG39p+WnyTirUGsOgTOlMDN1K1TME/
         JslA==
X-Gm-Message-State: AOAM53288AFLO04Wi+TnHWEVyn1HKRVXi+cOwqcuHSR7+wlj9W8nnpFm
	A7lMy0w7asH/xlVxSPiukKOagXitWwYOrw==
X-Google-Smtp-Source: 
 ABdhPJzhGsUOy3mSpsMjq7rv8qYeTFguYn23AMC4FQSiIs5qqIVfKWqZy3uODzzL9KFceGiTET+2vg==
X-Received: by 2002:ad4:5aed:: with SMTP id c13mr29268714qvh.27.1642650621060;
        Wed, 19 Jan 2022 19:50:21 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:86a0:fa:bb0f:c64d])
        by smtp.gmail.com with ESMTPSA id
 o21sm852902qtv.68.2022.01.19.19.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 19:50:20 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/6] scripts/layer-overview: improve layer detection
Date: Wed, 19 Jan 2022 22:50:15 -0500
Message-Id: <164265061563.2396365.18212162325767166728.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119212050.1886613-1-ross.burton@arm.com>
References: <20220119212050.1886613-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jan 2022 03:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2876

On Wed, 19 Jan 2022 21:20:45 +0000, Ross Burton wrote:
> Refactor the script somewhat, and detect whether the starting directory
> is a single layer, or a collection of layers.

Applied, thanks!

[1/6] scripts/layer-overview: improve layer detection
      commit: 02350369574cdcea2091048a04468ee515c7d711
[2/6] scripts/machine-summary: harvest more patch data
      commit: cb29175ab4c9a68e26b66aceb97463b32b3639c9
[3/6] scripts/machine-summary: refactor output to classes
      commit: 0d2d0fd69102cadb4e699fa41402227f60e56b69
[4/6] scripts/machine-summary: put more version information into the context
      commit: b1b0f37da7f4c670216de4225af024560e97248e
[5/6] scripts/machine-summary: write per-machine reports with more details
      commit: c4b34740cfc78485d22453d9bc284adc12216dcd
[6/6] CI: update for changes to machine-summary
      commit: aaac0541658b6d6e655662d53dcd27e5cd1bf018

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

