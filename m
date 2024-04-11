Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C065C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 18:46:28 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.26438.1712861180870452146
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 11:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2yg+5M1i;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78d54a3e462so8413385a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712861179; x=1713465979; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGfRDBsstiTISh8/Lc6PdKr8kQsv8KraCmiUDJUILsM=;
        b=2yg+5M1iPjJ/4Ow1aDbWzVA+O4+CtCR9fKhm+bN6sRqZuEsR3dim61515AJCdZO2nR
         r5bePSdTREeMl3h1OGSABTgMkFSjHXuvv9bvwynrUaMQ5nFh1xarsywdLkUu7QZDatnB
         +0eeptfphO0fGtcT5Tcap3fRiNzCVhGpBypizzUzQ/C5ytMubcjbOxHCu8BWIy5pDHTx
         7dP1AprOHrJ1rnDEeZBklQe4SdINJt10yFgUwouuQw3rSHBMFD6uhP0WDm6BpgThi+wy
         aRk40g3jGluXwoDRFSf46EivHYQMo5voZ0P2zIn4ioS3V6c7Y8/4dx58Et6kyy+iqcUt
         UwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861179; x=1713465979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGfRDBsstiTISh8/Lc6PdKr8kQsv8KraCmiUDJUILsM=;
        b=NONwLlsuz9gBXZH/3Z1vd83AopfTO8hwMR4rOUBg+JMLV8lLt0JHNtVMLoSZ8cPlrR
         74sFf3L4j3a/wp3rlhkxemhUsA2oDp5Xgxr7u/jQ7V9+bPtNHWEk8ilVCXPbsUqycl66
         4wYW2i0FUqL8iFWsfMEcBVf2cQZ9E3gS4YzTPpHuZVHHFQetrnosFe9IfS9knx8/ZXcQ
         H8aA8CdVahPXPC1RucUr39iLMuaAIJf0ZoIOxh/UWhlyPt2ODXXHPsMcISm5v+VLwy3F
         mTQjT7JwNOPVTLN0IFBrm/FJNe9z2DgDuUhNHhyCPb3/j9anCyStu8fpLev2GoSkhyf7
         VCEw==
X-Gm-Message-State: AOJu0Yx+iWHE+SqaGa8i8eoeT12b4kHlAxKO+fB/5l76vea6V1TvDW3g
	JRavkHc1gKgtEnjEX6IXc5WxTAsm2OcgcG02YgyZoHOzy3c1X12oK0fXyQZ3emQiFakIZebwRhg
	=
X-Google-Smtp-Source: AGHT+IHyHLxoItZBYtLyirM1K9DEud1IOpW9TFuB0Ntc+Uh2NJrBUgqTIXaB3HJmZYdIBNiTz6ekrg==
X-Received: by 2002:ae9:e312:0:b0:78e:b98d:1b03 with SMTP id v18-20020ae9e312000000b0078eb98d1b03mr513292qkf.49.1712861179724;
        Thu, 11 Apr 2024 11:46:19 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id dy53-20020a05620a60f500b0078ec6778be9sm696742qkb.111.2024.04.11.11.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:46:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: update to kas 4.3.2
Date: Thu, 11 Apr 2024 14:39:10 -0400
Message-Id: <171286075123.2560674.8121524526516051798.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240411130006.65022-1-jon.mason@arm.com>
References: <20240411130006.65022-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 18:46:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5531


On Thu, 11 Apr 2024 09:00:06 -0400, Jon Mason wrote:
> The new kas version has fixed the netrc issue.  Update to it and remove
> the workaround
> 
> 

Applied, thanks!

[1/1] CI: update to kas 4.3.2
      commit: ab4bf2700ff09dd9a15bed6fdd4bd71d5a7b78f9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

