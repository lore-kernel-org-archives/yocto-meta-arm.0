Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294CEC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:51:03 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.8165.1639147862652303594
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 06:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=dxN41sYv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id z9so8533852qtj.9
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 06:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=reeLUBxDitmLhcZcPVjIIDLYjZFie1mmXDWO6tp7spo=;
        b=dxN41sYvhCqqSojlUG3rh9LWzcDxnagLQjmVwl0Ejpqv1WrNqHR1A0KBDiS91M+8MM
         tu65d8Md8l0tfmtuCIB20hovuEfmPSLv985alfyP/WGPk/NQObq1GVGPZJe2h5zdvd0L
         ch2YOm+pl4OjWXCQw3SrN53dluBRNRXpUOyxzIjb0qCofH89qL5tbD48CmyHi8LW5lfh
         pZP5fFhpGraxxM6hH109FVKDEobSN5l6ZIx7HicRkiVM+8gZPBMaMHhGH5eN178uxL4/
         jocQNkPMHAYOG3R+GxYSTlqA7eekDeS5TRqInqJi1DpgBhtoaUweFd25WvQ0A0qEAcJY
         9FMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reeLUBxDitmLhcZcPVjIIDLYjZFie1mmXDWO6tp7spo=;
        b=X7YVNYL8jXDiAWlXOiXLztBs7aki2IGV2Ypa6ir6rJzSNCCcyZXgNPRzAi3UsQigSd
         v3XQPuuOyFhXths4yRDpipM5WEw0wWp2GhwNNwCClKObyuljugfkNNXjWaYnMe15IKpb
         jaUSv+vy/YEMtreUC0vqRV/g2bDhJCs/FVNPDPDSZWpWB7yHqnRYmrTxA9yHPlBeCad6
         XnEn6k9Wpbeql76iO3BajlrX9XQAImJGD4BIRv8if+fGhNymZ29tqLIkKNsMoiUBDiAk
         hN+6ChdfjYsJA6UZeMgQiqRGGycOMrUmtjfFdoGEk+q+3PD5KdcmhTXWmlURrzTXW5DV
         iN3g==
X-Gm-Message-State: AOAM531hQMolEm/5Rp/k0kbbv3lAU+DvUGspoVImiMAD0i9UHpBK6Wio
	mgVXjE3NJSf1E3wXddTdWf1G/EQGzN/dGg==
X-Google-Smtp-Source: 
 ABdhPJwGT4Edytm+D3+vFs5nhuV24rrYpFqfM2qByeGrcxhmDRLnoMJ8zOnhEh6tiefKyp/61o0qGg==
X-Received: by 2002:a05:622a:651:: with SMTP id
 a17mr27383675qtb.629.1639147861696;
        Fri, 10 Dec 2021 06:51:01 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:8d70:388b:b90b:fb51])
        by smtp.gmail.com with ESMTPSA id
 h22sm2094929qtb.86.2021.12.10.06.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:51:01 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	abdellatif.elkhlifi@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <drew.reed@arm.com>
Subject: Re: [PATCH] arm-bsp/trusted-firmware-m: corsone1000: Fix circular
 dependency in SRCPV
Date: Fri, 10 Dec 2021 09:50:48 -0500
Message-Id: <163914784919.9919.17851252299638257178.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211210113215.6525-1-abdellatif.elkhlifi@arm.com>
References: <20211210113215.6525-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Dec 2021 14:51:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2613

On Fri, 10 Dec 2021 11:32:15 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Drew Reed <drew.reed@arm.com>
> 
> Change the setting of PV from referancing SRCPV to using SRCREV.
> 
> Also drop the use of PREFERRED_VERSION. The existing TF-M recipe will
> be selected automatically (1.4.1). Corstone1000 bbappend sets the SHA and
> PV to 1.5
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corsone1000: Fix circular dependency in SRCPV
      commit: a5f0508464ea512b5dc3c528fbc398c373b59032

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

