Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA821C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:16:35 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.13595.1646327795409325958
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=oJ85A5dY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id jv12so4615970qvb.10
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zuzhQONvbvvOQFtksKMD7GQuCahlT5MNJgaq8wlEdmM=;
        b=oJ85A5dYUTbs4SA1dSVL7Ts8ud/WuZ5phPpaLzCKGRVsx410TfI7VOKYEJ9Mt3S0tN
         tnrw91wwLgiDQxh5nZD3HzHHkEQRm4WF1CP/DhPwUbUff+IL/yMdqwce37DOsrqRAIAJ
         nR+uChiQRUZcZA/RCM9DEh/S4y+LhwxoArviwVc/glXExxs4HbZUU+PSFSld3sVkQpxZ
         YAeJhmJXoygJ2M8bwvsQnHaaGdcZU66xEP8gthdsfFaaXL/p48rS6Y9WX/USVqhIWNnN
         nFmdGvhaLz4zzsQm+H+B8puzCGRitoGw1LtSZiQZ7S2wOskFdbhib9d5lIxH28TipAmC
         oUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zuzhQONvbvvOQFtksKMD7GQuCahlT5MNJgaq8wlEdmM=;
        b=GDtLSITc7lGnBm0/3RYi95Rbgl2L1A5ZKTx2Mj1bpyb/miiizBGkfBxUkwVeaeASaG
         06JUGKd9UnnU/cbu/5xCPoqPaVzO6uKYsfrXUdjmFqSNctXQivz1JzP1hV9AyVrrBxKp
         Zecuztc0oGzTJTTdqwJKRjhUuQA/1K+m4kkfOXkzZuFgb9eOX3XR8pi4cI7hTnz89CZ+
         5O38blQs98CKlur30suCsBYTt9HJGv2dK4yTNC/aL8P9/k/8umd7twizp9PCTb12clQy
         nDurJQ4Kvxbd9uYyLAY8CpWSq5lxwpkCSg3pXfWnXlv/zO3UnvaRI+HvCJ7uoIdm4WEH
         A/Xw==
X-Gm-Message-State: AOAM533roR0S4wpD/d9XX0mPs7/hOm+cQXxp1VHuli3nTJyJI40SE73D
	QqPy+EgoCZfK0dJ5TVT9X19pL1vhTwMhJQ==
X-Google-Smtp-Source: 
 ABdhPJz2jZoEcJfg3VAkJaXYK9xpzfUepzcHmtznZ9850J8Qltn/eMg7PooEK9Sz9PP1Axf5yRL0bw==
X-Received: by 2002:a05:6214:d86:b0:432:dc61:166f with SMTP id
 e6-20020a0562140d8600b00432dc61166fmr19963204qve.3.1646327794451;
        Thu, 03 Mar 2022 09:16:34 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:cf54:5e99:f9d3:d9ad])
        by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1310187qkc.117.2022.03.03.09.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 09:16:34 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	robbie.cao@arm.com,
	diego.sueiro@arm.com
Subject: Re: [PATCH 1/2] arm-bsp/docs: Improve fvp-baser-aemv864 limitation
Date: Thu,  3 Mar 2022 12:16:21 -0500
Message-Id: <164632778401.2165565.13287403687464838902.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303091144.473704-1-peter.hoyes@arm.com>
References: <20220303091144.473704-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 17:16:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3101

On Thu, 3 Mar 2022 09:11:43 +0000, Peter Hoyes wrote:
> Add more details about the cache_state_modelled limitation, which can
> be worked around by setting cci400.force_on_from_start=1

Applied, thanks!

[1/2] arm-bsp/docs: Improve fvp-baser-aemv864 limitation
      commit: 1bc6bf2750243dcc9fb4c4ce22590a11c825b167
[2/2] arm/fvp-base-r-aem: Update to version 11.17.21
      commit: dcf114723e38d4413d6c9c0f701114decb0c18cd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

