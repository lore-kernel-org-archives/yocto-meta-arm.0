Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119B1C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:12:45 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.13695.1671199963804172048
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 06:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=cKc5kAb5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id h16so2753254qtu.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 06:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdC+P50VRJ7WyDF0i5IAJ/5rq8g+Drb3ufLw22qrvlw=;
        b=cKc5kAb5X82DgXSYHMqqTJxeGpt3uNstGghXAYxV8YBpnDfCoqPkFeQWCWgIxP9HpB
         r+gW+Et0JEUkGUQkRzGVMKyBbCQr9ZxIjlTl26Y9C2qtxPE2QVrvAK3JmjUqwyScRTpt
         5exOtj+To6GEI8SFY2PvwUIuRi4IrHHHoS87EhJ7LghmQjYhlYRYB19c5m/jKIu/+Pr/
         /siHvB92UiKKv4qpBDAvpx6/d1eSxP8BQZWusJedeZ2hPNXPJBX3JVGQnz7L7HHv2hz0
         RCmZBno4VMvuj/0eFWspmVIamC2ee0gS4bXGmfqKay048D3bBy18bVStITCmzmHcDddK
         0JAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdC+P50VRJ7WyDF0i5IAJ/5rq8g+Drb3ufLw22qrvlw=;
        b=KuvXZQvetYiaiHkgORRBqYkWVWAQTrPFzNYbRrx+X/mUGwEZkAzZJJhGMZbEq4Qoms
         9tZYqjV9uG2HxnllVmK5rxi8+qBKE8uWgRRmLM8ySh7iVZEnUUZ9km6uZ6i4KW8aRrrr
         eGgOvOdO3ALPCkJW4t04oZpC+BOL4AHdhbatzIVaMyNNyz2YHnOrt6GhHCkYZcYL+ET/
         A4YC6T8elW4AeVMYX/nIbaUvasXVYbE47qypXxeP+AsGgHm5CxcwIEMiaACLyUF3TcB3
         u4ZpL3EU1+sCtR2YJvRzbmAqshcT6MDs4rn53Mn9tQEasenM8Q1nmmsngyjRBkakHQFe
         5KKA==
X-Gm-Message-State: AFqh2kpA/cDSS5N0cYgwnpE8ilSvcmM6/Pac3tj+HOvMnNhd9pFIC1nz
	nqYsCs+hWKcE8VEuxYCV9onKyREibUSMriVe
X-Google-Smtp-Source: AMrXdXu14ObM3I7SzdZrdOQgZlXZI7ZIs55IwgGs+LMel3oxCJABMvTCNSNtwFYsKa3fKgHI73FdJg==
X-Received: by 2002:a05:622a:2516:b0:3a7:f599:220e with SMTP id cm22-20020a05622a251600b003a7f599220emr4640945qtb.55.1671199962375;
        Fri, 16 Dec 2022 06:12:42 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id c8-20020ac81108000000b003996aa171b9sm1313068qtj.97.2022.12.16.06.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:12:41 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH][langdale] arm/fvpboot: Disable timing annotation by default
Date: Fri, 16 Dec 2022 09:12:02 -0500
Message-Id: <167119992275.2671746.13368118797402934694.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221216111941.1369079-1-peter.hoyes@arm.com>
References: <20221216111941.1369079-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 Dec 2022 14:12:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4197

On Fri, 16 Dec 2022 11:19:41 +0000, Peter Hoyes wrote:
> Timing Annotation is a feature of the model that enables high-level
> performance estimations to be made [1]. It is not needed to demonstrate
> a functioning software stack so set FASTSIM_DISABLE_TA to 1 in the model
> environment to disable this feature. This also improves model
> performance.
> 
> [1] https://developer.arm.com/documentation/100965/1119/Timing-Annotation

Applied, thanks!

[1/1] arm/fvpboot: Disable timing annotation by default
      commit: 025124814e8676e46d42ec5b07220283f1bdbcd0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

