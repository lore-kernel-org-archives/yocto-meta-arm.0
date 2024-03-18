Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A63C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:30:56 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.52936.1710786652452318668
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 11:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=l8bgRd3D;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.180, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso3947061276.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710786651; x=1711391451; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew/yAVoeOanXTHRyqpecmbLYVQyxYAK7rsn0iN8g1u0=;
        b=l8bgRd3DQfWs+5epIrOxQXvUY4UPd0plWf/mAQg+U0iDPGFJQCyu7lHDP7OqP7UmiF
         5JvIZgEdQ4X/AxyMHoPd7TzaAgvGt/iSmzXxCJY7j4gQRT5KsdIxIft17glpD/O0orjh
         MLw5zptP4wGBkO1yk0E81zcD53DAvMdwFqfvozPj5+Qt2OcL1+xZxBca9bztBJ9SaCyH
         0oQWLhgReZAVSPPDNB9ZLYIeYNZFd4v8biu98AI0ZVdWET0qRwo1NqzLkm7E9dsRbx6B
         nVFG55Y+EXamhSiC/9WgGzWYvnfWhiKCkoHjGyA9xd06QAM7T5MMOCUKfg7ahRueuQGC
         AYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786651; x=1711391451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ew/yAVoeOanXTHRyqpecmbLYVQyxYAK7rsn0iN8g1u0=;
        b=kjzw+RX3bJoLeq635HNaueQGjhhcIBYHaSFuy2BousPWxtRqfOCzblwJAGPJy03Drr
         llJkmIHFS+TW0LOBjuPCkhvgzzCv4uL0CNJ/ZgIGhtr8gOii4wG9LJe+FNZIXO861YD4
         +mdmf0WHuG18TfcBvhSxrbIwErWC2yJ9pO7SU83PR0e0P28TSVddL5M5rYm+VGI3vigR
         Ys5DmptPSiT4hfthI67efNtw1Vcugq7F2GOYqVEZUOTQV5l3egP+8UgEdXmIrQonDPJY
         6Rso1INXRRwG5B6F51KpFMl4u0bopIeg7yL/R3boH1gh+hBORa0upP9dPp59ELFa2oKg
         VegQ==
X-Gm-Message-State: AOJu0YyxgVjhOMGcdJHyZfOhQdr1/vX+yEhAon69ylPrpWek/A8UNYaq
	HMD6hRe3JU8m/jQMpVxcBDPQYtfPcKbn2k+IDnB3e/iI91qNWUQ0IjMy3GT8AC+QqfFZl5FS8fA
	=
X-Google-Smtp-Source: AGHT+IG/ev6XxM90iU5vs+7LBMeBCsvVAGZgSADPavAyWuDGm72otirmNhhfRPytM713+OXDAO50sg==
X-Received: by 2002:a25:8591:0:b0:dcd:59e4:620c with SMTP id x17-20020a258591000000b00dcd59e4620cmr10778411ybk.49.1710786651517;
        Mon, 18 Mar 2024 11:30:51 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id k22-20020ac84796000000b0042f07081f26sm5219157qtq.22.2024.03.18.11.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:30:51 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH v2 0/2]
Date: Mon, 18 Mar 2024 14:25:35 -0400
Message-Id: <171078633829.3024366.11907062801148039478.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240314110457.230569-1-bence.balogh@arm.com>
References: <20240314110457.230569-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 18:30:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5453


On Thu, 14 Mar 2024 12:04:55 +0100, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> Changelog :
> ===========
> 
> v2:
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: corstone1000: fix SMCCC_ARCH_FEATURES detection in the PSCI driver
      commit: fb1a85a43c663d9e44047fc5e93af5c02c711c98
[2/2] arm-bsp/trusted-firmware-a: corstone1000: remove SMCCC_ARCH_FEATURES discovery workaround
      commit: 0792a314f623b4143652563d6db9a840b2b8226f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

