Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52819C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:04:42 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.1963.1667847875690596134
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Nov 2022 11:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=1a2sCKx6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id x13so8755214qvn.6
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 11:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+OSH5jC2HC9TkD/oCqr1SyMuaqXSnLEZMaSWhC1s8k=;
        b=1a2sCKx6NkdVDXQ6aNPxetvMk6Mv4ru8885IoZCUijd8VRP0F1Vfo09HqMz9ETwEUc
         jVYBIFQmu9Wq5nGsIpqtFwuB3LcU5ruoZBZJaZkv4OmDzX/qMNk1mUOo/vnECySGJxsX
         4zIVCTxaQ5rWpQwEMmU7W2QtvR3chIKACrtntxhpFQvYA5VEJpMc+cTB5Z3/iP2pD3/4
         1oTbMFmPiuJ9TxUGRnA5MxPar9MV/6FrRszqGwwtx+5Zgsz6fuchiWnjDGKgZ6wjXQ0y
         vW0tIvZDkGLiXoDIe57veF5AO8oq1ZWPcGrUK8rI6Vg2Bp3YecOEvph/DObQ/vWCOpkY
         pk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+OSH5jC2HC9TkD/oCqr1SyMuaqXSnLEZMaSWhC1s8k=;
        b=Dh7H4gbfFCOP9StX3qatrVY1qNvygkfRR1RsD/Y79mPeBlQIct3ZoRvp0WinubhsZM
         TAvswjNvJ5+J0GNBOL2dpJBT0MczRgZjW2VprE0da8hJmd6W3pETpR7U3fOHSxSd8oSv
         Ur4tzNL/Nzk+oBRmTadcmuAu9qaUpb41IYUGttX+3Hh0W+/kIRMLSKTN1dYYtMgvsKNY
         F9wG81owfkMQXsdhyVjekU/MjqJR//X/aJN0IpQVlKLTuBpuk1eYwNeU6Y9VCtwp1Le5
         IyRomn/a9T8N47zu6QDhWamhMmAeLGjv+vWeoG5hoVl41dDWEgZfVeYBU6che/+NsVh4
         RIIw==
X-Gm-Message-State: ACrzQf2xbb2gDWTzs4dzh9itCxe3YVCwoCAFtFMsBtyGUQdvwLaarjQH
	Qp29S+SvzLFURJNNhzUjkrcfUMPA2dAFyA==
X-Google-Smtp-Source: AMsMyM6wn4FIARthrsSOx+nyFl4a+T4Bjqm0mzWoEQYJqKtriVxQt0Y5LEpEGNF7WBjL3GLMFSQojw==
X-Received: by 2002:a0c:f44b:0:b0:4bd:e8ec:263c with SMTP id h11-20020a0cf44b000000b004bde8ec263cmr601784qvm.104.1667847874266;
        Mon, 07 Nov 2022 11:04:34 -0800 (PST)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id l17-20020a05620a28d100b006b615cd8c13sm7536112qkp.106.2022.11.07.11.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:04:33 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH langdale] arm-bsp/fvp-base: Enable virtio-rng support and unset preferred 5.15 kernel
Date: Mon,  7 Nov 2022 14:03:50 -0500
Message-Id: <166784783591.2324924.8732386385921058626.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107154609.256256-1-Anton.Antonov@arm.com>
References: <20221107154609.256256-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 07 Nov 2022 19:04:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4109

On Mon, 7 Nov 2022 15:46:09 +0000, Anton Antonov wrote:
> Without virtio-rng enabled kernel 5.19 takes ages to finish
> random number generator initialisation which causes
> issues with ssh and other crypto related services.

Applied, thanks!

[1/1] arm-bsp/fvp-base: Enable virtio-rng support and unset preferred 5.15 kernel
      commit: 99e1bf822905888671b80607f76b437b929f49a3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

