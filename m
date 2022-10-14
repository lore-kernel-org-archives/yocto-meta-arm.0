Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80666C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 18:21:00 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.10842.1665771651198777434
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Oct 2022 11:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=3qXaqzAA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id mg6so3743280qvb.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 11:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lk4/rcWbTSX21WakaU4j+dmQ30V1pTFPf2EkKZrYM6o=;
        b=3qXaqzAA49+opZ4Cc3F9tF4vORIZT4KOBGBUETN4PVkHCpvUtOdvAW3FwLu1K72jik
         d8THQ8A5L77GsIYpzV8r2+Ndlxy76mrMYdT1/dr4l79KvzEcOsLQpmb/4oN8FmuIpeeM
         rgk3ADKRQfTWrZbb7Ln3Alj8+AT0ArCoN4C6Jue9dgNlQaR6Vb6Pcd9iwgrMoKhp3RJ4
         xwsJp4EVxfx4rxqK8DzfFOhe0rC4BDqd2BfeSH2BUtqg16t2lybXS2ln9EzdIBC5DAWD
         OfkjgVJLz6ZsbxKn1r+BCedwT/U4EJK0Oy6O9QSJ4+sthmz+pct/OTwHuhdBRxBo6Rns
         I6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lk4/rcWbTSX21WakaU4j+dmQ30V1pTFPf2EkKZrYM6o=;
        b=EYHIipJcWVrksEx0TlGv549yvq53qoiVys01VifrWpyqrp1WLUE8VXCwwxmJUCoF5b
         Mv+Y1JPevBfAUoR6mcSXxpMlhRROkpaoQNrb5N9tnQjaAvtOx6IKD+EaWFic1Z0ubZIH
         9q2wwxi+oLoEntrgQ4x4WroAkjj1RFX0MvRQDW+5yONllJlpw7pJiwTfk5nnxsr97gI6
         NGSNt53fQlttOJ0anLp11JpweqDIBfrJex4jIfjoyWJWG3UiNkQrRIPdqGXu9a0IaemR
         FlmdNmnom3vzdFtG8Y1Smowj+iV4hCxpBKxLnYHtwjOij3JmH+RDcVkFRdtGJP2gUXPP
         WQ4g==
X-Gm-Message-State: ACrzQf0Lb3GmDMedTLRiyCs7LWNUtQkdwMcV5c6Yi61e7FdyZfRYNYPT
	2PXP+jbrDJW2QI/7mTQnEYMRzY7H0sR56A==
X-Google-Smtp-Source: AMsMyM5mZqoOKA45njlDBVl1SAVXYo7H3UZww6Q605yn9bJZ/pKDqO4JSMChwZ7d9QfALdnFDHqNHw==
X-Received: by 2002:a0c:b447:0:b0:4b3:cf2b:92f6 with SMTP id e7-20020a0cb447000000b004b3cf2b92f6mr5318632qvf.79.1665771649908;
        Fri, 14 Oct 2022 11:20:49 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id n3-20020ac86743000000b0039cc665d60fsm2456812qtp.64.2022.10.14.11.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 11:20:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/kernel: Fix TEE driver bug for corstone1000
Date: Fri, 14 Oct 2022 14:14:20 -0400
Message-Id: <166577126165.3623779.13837276428194971716.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221014121230.16045-1-emekcan.aras@arm.com>
References: <20221014121230.16045-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Oct 2022 18:21:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3972

On Fri, 14 Oct 2022 13:12:29 +0100, emekcan.aras@arm.com wrote:
> Fixes the Tee driver bug in corstone1000. It adds a
> delay to fix a possible race-condition occurs during
> FF-A calls. This is a temporary fix for the upcoming
> release.
> 
> Emekcan Aras (1):
>   arm-bsp/kernel: Fix TEE driver bug for corstone1000
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/kernel: Fix TEE driver bug for corstone1000
      commit: 13199c55c013c6f303258bf9a32d289211fe6a5c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

