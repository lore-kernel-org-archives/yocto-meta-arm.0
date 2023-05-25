Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44718C77B7A
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 00:52:15 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.1917.1684975925329142711
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 17:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=xV+Wn0Mo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-75affb4d0f9so23242385a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 17:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684975924; x=1687567924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbNl/eBGzKp3kObfZHUfTYr+rjHsFu79SaXMSEmVhds=;
        b=xV+Wn0MoKi2oTD6owf8w4C3BC45ugE02JVX12ScTWcc2LOYDMVldqlCFdOYu4dGN8P
         UpxULm/EgAko80seNAG4MynsFCR1og1ByD1cix0YOSOujsj2XLtbLv2N0cr4Iu99k8VP
         rUtxdzwUUIS/wDeIqZnGfYdJILTEVoIdv7WzFmsjvKEWb2bHg8ksVc4ZM19bzUHrFJgK
         ttkoGCfABeqQlhbKeYu9KjJVxSUjYRHqDDTOh7KWFadDdWvcV4DJgaaz0QGwgF17eXXV
         nX7I9mD8mo/LPeAB74ylUmX9h8Aevl2axeR5UCZH/xchWA1NAIYnjCBjbHPIP71TGHjL
         0dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975924; x=1687567924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbNl/eBGzKp3kObfZHUfTYr+rjHsFu79SaXMSEmVhds=;
        b=MHKsVRSqoZm5k7jJOzp56ABnl6XtxUBuLSWoQgNJL9jx3BUq2HM4Qmdgpta4xODQ6a
         cwKCKCq9Py9VnsnIA0nTfVUhrD+oZ7xAh8G/7dfGpbCBvtTlrg2/nY6zG7HDVEIWQlb/
         FUhKynuwcd6uqqU1n1Ty+4U/MiI8/i4M1m5dTSh5wwqARPoFDitXU2U8fxuS+qqtRXVr
         ttmZITV59LReFVw7QE443yyKa7A9jh0Yzr+vee5XD1m/+IhT3hfUuH832d56ZnYCl82R
         7g9E0RdRunqowqoXYbJPRE5U4e//TR83g+dXya+owKUXZLeh2lKmgoPjph75KGpRawBm
         RpZg==
X-Gm-Message-State: AC+VfDxhsc0jUguwSvkHDRYiPHfgswTYRV7PkEcIxpd1X9X+yuJazLax
	TWvOGdGpPg5XANbZonlzXoVIDzVV15Z9UVrBL74=
X-Google-Smtp-Source: ACHHUZ5SUw3LgQzVaTVWAtkfdwS1WiBhp3wLGglrKr+xeVPKBfQ7nDHNmm93SLGXTHZGkkwax1ZdUA==
X-Received: by 2002:ac8:574f:0:b0:3f3:92d7:35b with SMTP id 15-20020ac8574f000000b003f392d7035bmr30972363qtx.18.1684975924134;
        Wed, 24 May 2023 17:52:04 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id c14-20020a05622a024e00b003e4ee0f5234sm543320qtx.87.2023.05.24.17.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:52:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 1/2] arm/lib: pass the PATH to fvp runner
Date: Wed, 24 May 2023 20:51:36 -0400
Message-Id: <168497589902.1985833.9251532556611486711.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230408081158.7575-1-peron.clem@gmail.com>
References: <20230408081158.7575-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 00:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4697

On Sat, 8 Apr 2023 10:11:57 +0200, Clément Péron wrote:
> When running an FVP machine the model executable need to be found
> in the PATH environement.
> 
> At the moment the script doesn't provide any PATH to the subprocess.
> 
> Add PATH to the allowed environement variable to be forwaded.

Applied, thanks!

[1/2] arm/lib: pass the PATH to fvp runner
      commit: fa598021fb387e98bdb80861f245cc15acde4ca5
[2/2] scripts/runfvp: Fix KeyError exception when there is no FVP_CONSOLE provided
      commit: 316e02c0f13b473e916cd779e59f0d55d48e4962

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

