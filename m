Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FF3EE14A3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 14:55:30 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.396.1694012125515789510
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 07:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hJyzA/tV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-76da239ba16so218686585a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 Sep 2023 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694012124; x=1694616924; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezqEEuvvzMqeqwqW4KXunbPhL0+Vd6bxWaht2COvDAc=;
        b=hJyzA/tVYQXSsvJBuMSLlKTIuYhtg1mH0G1MCzbOvB+0lIriQIbbIqaBSwsdmWRlFq
         YrSSJe96JmvFrmYaDcJcSfICEr6qL6a/hXm37SGYdNWPkuRBnxh/NSGiP5Uy9QDWnHFD
         DBQ+rHJ9P/9B41AM+6hcstbuZdQ4Mqyhiz+MtjI/FcYsGyuxDawFStmiywYJVDNrwFDq
         V2OgL4OToshw8PQCeTt4Qf9rR/7c8mmLcAozJXHGDqMUaIC/tewU/W3AgAjvFn2Dtn2d
         Y+Tg8BJp/jdig/ad0pZv75ikzo6iCl6vWOUbxZtVr74zm9Gu34x36gW4XN3xxVQV1oDq
         KJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694012124; x=1694616924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezqEEuvvzMqeqwqW4KXunbPhL0+Vd6bxWaht2COvDAc=;
        b=YLTdnB9TcT4yI+IkBWwLVRH4wlHda80cMsm2m3EJk9SornPHamyK6ZWvfXsd/c5o8T
         mP7d3Pu9t/Kgi6xNEinrxvAO5prPhEwVVA4xsOJ7kOvdj+Zha5jK7DoWYNLcgcMl7UUL
         1lv54qtE7Px87y6plzhNJEUlHCOh1pZNyCAZcxjRFlKcK7JFjYE6+VXiMUNbwI1fVCM0
         BX7zpSUa6aoiO1dUZFE3yhvJAaJRN1DuyQX1e31OWVyjCBeAGB0iJWBMQUyeCQzmWqPm
         tKyABXAbzWcz0LMUanRXmDDIKthAMEdjJRdK/KU8YjvaljD4FlgFR4GcRoWKPAAURQ/E
         8RKA==
X-Gm-Message-State: AOJu0YyRqMoEuhuk2XLJ4gOOM8UbVZd3x4w0ISv7t3LBw5BrvTrfkzvo
	c/lDvYa/aYvNkLeFrit2pFanhbQrM2TpHJtsb/o=
X-Google-Smtp-Source: AGHT+IF0Zs5kZCF2WmAQzkTsbDAXJ0QixAabSX5QY+upklVgwyi0P3WT3ulRhShF2UvFBRWbTGd2yQ==
X-Received: by 2002:a05:620a:2a11:b0:76f:1011:cb23 with SMTP id o17-20020a05620a2a1100b0076f1011cb23mr23027927qkp.16.1694012124132;
        Wed, 06 Sep 2023 07:55:24 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id 16-20020a05620a06d000b0076dacd14484sm5016226qky.83.2023.09.06.07.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 07:55:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	mariam.elshakfy@arm.com
Subject: Re: [PATCH] arm-bsp/n1sdp: Update edk2-firmware version for N1SDP to 202305
Date: Wed,  6 Sep 2023 10:55:02 -0400
Message-Id: <169401210213.3415554.9628811584350711346.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230905103722.3752-1-mariam.elshakfy@arm.com>
References: <20230905103722.3752-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Sep 2023 14:55:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5022


On Tue, 05 Sep 2023 11:37:22 +0100, mariam.elshakfy@arm.com wrote:
> ARM Reference Solutions' N1SDP 2023.06.22 manifest
> uses edk2-firmware version 202305. This patch
> aligns with the manifest.
> The RemoteDdrSize cast patch is now upstreamed,
> hence removed from the patches list
> 
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: Update edk2-firmware version for N1SDP to 202305
      commit: a262d308e78b9ad5c0f92c77714c7a354c5ddcfb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

