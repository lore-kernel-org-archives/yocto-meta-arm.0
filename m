Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F42CC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 19:33:07 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.504.1665689583066040289
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 12:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=2Nn33vWN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id i9so1955227qvu.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 13 Oct 2022 12:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuetVCJBnnZ9hQxFcTzl8HlSWO3giq5fEuTKWBUtfxM=;
        b=2Nn33vWNXxSc6jD6bFaD7xNoFyNuEcSVTzwbNW1dMiHQY9XJ1XQmYrQBDSO5V0gIM3
         Uz8QmNVLU+cmnMeGgEB0JKwZWWPOf4a7LLv1o1ajyFLust85JdKbND4XCkDEv8i132K9
         Jz1svf1zPhkAY0XyeiXKx0P1gkzgFi9/wL95uiwumjo8LIUziEWgcfgrrnW98FnVpBdo
         Ts2IdzF/mVj533Lllmyp2vHd1yIVS8quSppYBouCrRnqzTJLFi3DI4IWasIpC+2fpx5P
         wia4wEUXjl+I9tDryjUVsrENw1zpxcQsIyyKmypL9ypZcSNyxais+CeO4yPZhO1E1NPw
         GhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuetVCJBnnZ9hQxFcTzl8HlSWO3giq5fEuTKWBUtfxM=;
        b=2vpoEdmjDR9QRT5n/5FVM30hebvfbDiz4BoUJd62YUMgIusoBuaFWirpHtLx5rgwDQ
         0w2cPS1AgR+V9CtJQ7CyyXu3Me+L41146Vtld1+RyDSEAfiImtyaikMqAOXbI0d92jw+
         CrpWKg3535fHu/9YclYM/qrVCJFwD/d818dycRi1XdY4KufyNyZjaLpwPKZox1y1GvPr
         Wnx+D7KBP1u7VjNBnPuRieUaQbLLUdf8fSGgTFWJEhw77oK3ZcnMHaeOR9vYOq2/Q2Vz
         oPSnTOwvRe6Id6K1KBhEKiCQR9nKlsbO6WyY3kNAusU9PVLNhYkPwPOz0GTqC3UEuRdo
         x7rg==
X-Gm-Message-State: ACrzQf3sCAHnvQXAtmINy3UYG4gCyRS548SGg77l6U8PQPhoU3Dzml0D
	yS4iZUqkw6N0LQyboEtmpQVn/Xmg+3tRCw==
X-Google-Smtp-Source: AMsMyM4XlyOOcWacs4rzWx4IUTJJZgBM+F4UM+KxyuDCqsBBnZV0wiiej1gLNX/yJVRaax3h8LdkBw==
X-Received: by 2002:a05:6214:20a7:b0:4b1:7c4f:a218 with SMTP id 7-20020a05621420a700b004b17c4fa218mr1370726qvd.85.1665689581572;
        Thu, 13 Oct 2022 12:33:01 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id k13-20020a05620a0b8d00b006cdd0939ffbsm410697qkh.86.2022.10.13.12.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:33:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] arm/trusted-services: include documentation
Date: Thu, 13 Oct 2022 15:23:20 -0400
Message-Id: <166568900028.3051156.10710528150184670904.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013154740.3368442-1-Anton.Antonov@arm.com>
References: <20221013154740.3368442-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Oct 2022 19:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3961

On Thu, 13 Oct 2022 16:47:40 +0100, Anton Antonov wrote:
> 


Applied, thanks!

[1/1] arm/trusted-services: include documentation
      commit: 90f9e1241b8332fb79b0fe77d1f3e407be9b8576

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

