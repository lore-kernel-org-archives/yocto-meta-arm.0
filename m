Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2129C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:45:01 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.9622.1667324694891730512
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Nov 2022 10:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=CD+3eZF3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id cg5so1020289qtb.12
        for <meta-arm@lists.yoctoproject.org>; Tue, 01 Nov 2022 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8rxIG5RdHXIbyUHhpbF1jA47B/1jIUcv4wkGNMniAQ=;
        b=CD+3eZF3APia7wJsBRM6jibveNXja1fjCQZsLN0fv329LcP5qNUqzfbiznFUs6ofQW
         ozjBdubNTh4ar5gaOB38mt6kTArnwcnrMW/gRtxBD/Qeg1B2x4XcAaGaN0+4qfz8RVag
         qt19fsBLhOXJtpM4mG5TYdJFwZnRxV+/BNTAfH8aAbkENpfolhFNymsV0ijoPgER9N6N
         mHZPibB7wys0LOLwI7TtNOOwx8Sih/nFcBVO6gwLEjstuduUxQkWPogY8lNMDbAz865L
         /kCU60DZmxn917X4nsQgSfQtMG+SLMQMpLfT7qayqXw9QYAwwGvvcMimpJXRZkG8/Tkq
         inFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8rxIG5RdHXIbyUHhpbF1jA47B/1jIUcv4wkGNMniAQ=;
        b=t+r49Tf6L/nQLtWg5P1fx0aFLgHqHfzIIhmXrv2iQJK0P15cHlWNxjT8kXbcEuodb4
         XWQymk3WKERQ+QtCS3pBc/6K+zjKWN4TnwbU8sz3YyQYtnBlLll5+osCkhnG1hAhKMnD
         VrzPY9au45wbKYzFfOYLycXT5D3ts9ufig8LZuluAm34N7pXwiLQoR79oROnxowZ1EK5
         aTktF8ZN3Gb2NWg4RtW3e59DA+OFjUZIOXHVwk9281LHPoGBEGBn+wxPvn1VSUOc5Ovw
         plrKH8DGbRv9IwcaNr09ZLIBokrBBazVKTeDHS/3yXHf78YuhT8QCEMhGLgk0+WZJ7/a
         ujUA==
X-Gm-Message-State: ACrzQf3NPwcMGpVpQ96Ij9DvLNDmu/VrL5wO5rXW1Y1KYJne9i15eSlN
	LtiMjov6Rhke/6XiRL9uq69XRj4xTIq9Tg==
X-Google-Smtp-Source: AMsMyM799fcok8QDi0RwBwJ0oW3KKdKKvNCTCk55hb02gK8UhnoysF0khIHHC1hmzwuRf9H51Y3lIw==
X-Received: by 2002:a05:622a:17cf:b0:3a5:1f74:959b with SMTP id u15-20020a05622a17cf00b003a51f74959bmr11150276qtk.684.1667324693409;
        Tue, 01 Nov 2022 10:44:53 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id g1-20020ac84681000000b003a4d5fed8c3sm5403039qto.85.2022.11.01.10.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 10:44:52 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: add common fvp yml file
Date: Tue,  1 Nov 2022 13:44:45 -0400
Message-Id: <166732468769.2289176.4774215518517944055.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221101130303.29638-1-jon.mason@arm.com>
References: <20221101130303.29638-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Nov 2022 17:45:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4070

On Tue, 1 Nov 2022 09:03:03 -0400, Jon Mason wrote:
> Bring fvp-base and fvp-base-arm32 to match what is currently being done
> in other fvps, and clean up the fvps to use a single fvp yml file (which
> should enable better adding and removing of issues common to fvps, like
> xorg test bugs).

Applied, thanks!

[1/1] CI: add common fvp yml file
      commit: 75c252049c55f9986d9751ba097b705388968e00

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

