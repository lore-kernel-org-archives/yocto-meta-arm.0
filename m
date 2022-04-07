Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41905C352AA
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.6387.1649337154029158959
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 06:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=gT05O+P2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id s11so8029935qtc.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yxe60NJkQ4xFD9pCQ0z+l8B3gFcZ7TfA0PCGmda14qs=;
        b=gT05O+P2R4ZxIve5x0TKW5Ve/LGdTk1IwdpYs0/dMBAWbfTzVvrBlgPylweGj3lpdq
         rZj+Gz6+Qyl+rmDg9ppGuQYwPTz7DYFSKVO/vFPDbd6n2+Tn9zSSms8MphoaYlNwZE7X
         rms0t72tXCPuBZ+pO7T2P56gJVh8/kszJshKi+WRvBRNhc1ahV1U5/IIBUY6eUvqqmGo
         yKlRvcidCLEKh0MFjcnT9/YaCchMLL6iF8KAliJJDuv+i0pmYQYNSuE3b8ts9blscfKe
         OrryoILcdCzbpewaucfQK8Q5TDhufBvHqJt3x+IYmCKaNGg+pWGM0pQhdI5zlk0prPSd
         5QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yxe60NJkQ4xFD9pCQ0z+l8B3gFcZ7TfA0PCGmda14qs=;
        b=OzJmPAyRh1z7uA2ltg7CWVryBSkTe5+VwFQ+CMOv1skSsgdLNdKNbEuDWUbz4kuGHW
         HhBCG8RjpFeBLOp3ooi2W6poqmjo3z67NfPyCDAZilt14i38TZF98UGtbw8ETi7ave+0
         ALqIho6QlIhN2FH1NkIChbEW3RGT3YKdeREyVazgG0jlBHJCtq2sp1Rjg4qwXYYilzlz
         cn4NWVqmHhOgbjc1DfMcgvyItRME804FiezCfJg7pmAfYzMwP6/B3RHgygqCfH35HDLq
         J1wajlcvbUsVmlZc5K1wuLpqL4j422FJG6fYmiHJi/FVUGLBRQ6zmacQ41SL+/Rh+vTB
         dowg==
X-Gm-Message-State: AOAM533Qt0aEwStXDGa7RkduUgftAsvrjyr1LBhPBsLpz76jEMXgqH5n
	Hf1cb4AXUz2/fJyEdHrdQ8UdhX0S9jsGTg==
X-Google-Smtp-Source: 
 ABdhPJwaLNM67lM1dXb7M3G0wayP1N1y5Phjnbg77bfqQaqPLCUFcJ20SES4jiBtqXpyIuQUVbZvUA==
X-Received: by 2002:ac8:7d91:0:b0:2e1:be79:7fa5 with SMTP id
 c17-20020ac87d91000000b002e1be797fa5mr11601924qtd.581.1649337153093;
        Thu, 07 Apr 2022 06:12:33 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm15390103qtx.15.2022.04.07.06.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 06:12:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"satish.kumar01@arm.com" <satish.kumar01@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH honister 0/1] kas/corstone1000.yml: refspec update for
 run-scripts
Date: Thu,  7 Apr 2022 09:02:19 -0400
Message-Id: <164933653935.4028753.8367138143548948067.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406083031.8746-1-satish.kumar01@arm.com>
References: <20220406083031.8746-1-satish.kumar01@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3248

On Wed, 6 Apr 2022 09:30:30 +0100, satish.kumar01@arm.com wrote:
> Patch updates refspec for run-scripts inside corstone1000 fvp yaml file.
> 
> Satish Kumar (1):
>   kas/corstone1000.yml: refspec update for run-scripts
> 
>  kas/corstone1000-fvp.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

[1/1] kas/corstone1000.yml: refspec update for run-scripts
      commit: 142ec9b8f99759a1caaa5380b3276e99e5e698cf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

