Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B59C3DA6E
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 00:46:29 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.39786.1704501981141383721
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 16:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=i9x37LZk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67f9fac086bso1112366d6.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Jan 2024 16:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1704501979; x=1705106779; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vA38EWM0izzoR69rsaRBP56cXkxzrtrUOteCLAxrytY=;
        b=i9x37LZk6zAnvH15iXokgjmr1Bts1RxTeQccaet/g2KyI2Y/evUooQcMZ1/aGcAMQc
         MqmYIeG4xGkMl/iEJpqODSYuzaNfhTkBpkaOoPmmOeH+DE5dMAzEAWdeUX3lh+GZ+Ohw
         gCyqk76vAl2T0CV3omJuK0YdIZ2YFcnb83nyQ+FW0og7bhk1xoIK5Ids5q3W4NHZzPB/
         LHx/ulrYPGRm7eFJxpmnloTG268PBpHjXNb38TLg3ujEvHw4v2b5vg+7MqK2xObUhAkc
         5Qz3d2v/s/KQ1qcerkAeqP/Q5donRFnti4oseDvXlTl9OIaeUW7C3mPKHDm+GoO8WtJe
         4iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704501979; x=1705106779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vA38EWM0izzoR69rsaRBP56cXkxzrtrUOteCLAxrytY=;
        b=gfIiib3rMDK7/Shr47NdqJhDCc+IfeKNRojvCgrbOMn1nmVk86owBahc7fNDoxrRec
         HofqX06mws3w05wPiULJImETAukIbJGjQyefy58SwQPmCSnLccoSVoqw5csGfhuhmcjz
         HyEjKF0waccj8wJUbFzG2KcZ7XEqtXs1lNdLeAxX2ww1XdoFEFmmCeqRpP4gigFR86hp
         ZaH/Eaa8Xm1+1DUMpK3NjCjOzSFBy69tM3l1VqbSjtpx+aEr2usj8WOL8clAhLCcR4mY
         aw4EcwwHvS/EGQzSKsmz9Ifkt3t9y0kETO73hgSDPfhFt/zIM/qMCJ5IEIjp4NFHAnKU
         GRUA==
X-Gm-Message-State: AOJu0YxkYYZwYQr9h+Zp/x8eETvtWbjHGheX68ueyAvvIWF8RQTFjNDg
	Z/LnCYBHZT1keKurhlMC+LLOGFT7Y1/VWek95GJckPh1vg==
X-Google-Smtp-Source: AGHT+IGJz6UMS0tlNOtPg95+CbZrUBsWsGY4qr5XWHB2EJZkREjanOGM8+6IEaxLB7UuAVs+zKQJnA==
X-Received: by 2002:a05:6214:20ec:b0:67f:4632:5dbd with SMTP id 12-20020a05621420ec00b0067f46325dbdmr266689qvk.54.1704501979378;
        Fri, 05 Jan 2024 16:46:19 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id t3-20020a05621405c300b006809d6fc192sm1015309qvz.3.2024.01.05.16.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 16:46:19 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/trusted-firmware-m: update libmetal and open-amp to a release
Date: Fri,  5 Jan 2024 19:45:58 -0500
Message-Id: <170450196047.2446090.7085865291471009594.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240104204730.27174-1-jon.mason@arm.com>
References: <20240104204730.27174-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 06 Jan 2024 00:46:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5315


On Thu, 04 Jan 2024 14:47:29 -0600, Jon Mason wrote:
> The SHAs for both libmetal and open-amp are intermediate SHAs, which are
> only a few patches behind the v2021.04.0 tags.  Update to those tags and make
> the necessary changes to get them working.
> 
> 

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-m: update libmetal and open-amp to a release
      commit: 01e60aa0e3fd78028118c5602ce58e316e07d04f
[2/2] arm-bsp/trusted-firmware-m: update libmetal and open-amp to 2023.04.0
      commit: 2cc6f05f3e091c33661e7bee1a23a57966076b0d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

