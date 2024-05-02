Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1E4C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:43:16 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.15412.1714660991345380350
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=BoYMJjAh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.177, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c70999ff96so4365179b6e.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 07:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714660990; x=1715265790; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUDBt8cKopxRJY89MnrzTME1Zj6YsjWsRpjmysm075Y=;
        b=BoYMJjAhPlJ6Xmy8v6yYkeEE88FPRXukRJMbYdX/7QJEIIZ+QRnchl8jCuUuYxulcR
         KB+/hJSlwNDbr6vo2S57qQmGWj+01tu0GZsF1UtUsUFL7HRtUMJ6Fi7IfL9banw8Yf3z
         ot7B1OjCbC9BO/I7WcE3Lr2FAGRgt9xsAxtfb4phz/61PfLEuX0gxMGI3HpN/fsIa2gM
         fhPxC4Ltc0MOtItN3LMM/nvmCqvu9cqOrFGGGqWlwH7HQtufPOjOZITrtyFWUG5cI2Ft
         v7sSyJ9g2mfdT2yvPS/J1DSXYtHQjbCfGpPKBo+AikXs43Lkm3luAf/7m7xBjUXdUXBV
         uS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714660990; x=1715265790;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUDBt8cKopxRJY89MnrzTME1Zj6YsjWsRpjmysm075Y=;
        b=ZjJWRVNWZWwr2lzxSqXj+mrFcqKnIbsWb3ekQ7mnrK9vF9wmBNOaTQB9z363+/kigN
         ExZAkGvh9NL+2/piD99ARmZnqbhQPiFtjLGUdHUsO0qDdcJY5pIYYV9HyRWt9iXIVMYI
         DO5GrSrg3Fv6Ln8P/w93dp9ULOoY0yckxvuBowAR3OjKs5dxznAoggXtD3Y2E0k1yOtN
         1IXMDW3uQjMEDXsITq2N1Ju8rIWcy2srh3XR6tOJZNvfWqRvMsmeAQOjkwV+RZECRzJJ
         8Yo1JRoo8hFNOmBIX+0x8MAaj9OfkFSIhxLM293wNixYUfDhsFIgZRq8tqkxsNROdlB3
         xHCw==
X-Gm-Message-State: AOJu0YxrnbXI+R73tuYektbdMZENqqVxv28Sy9kTyy3CSaYWbI1SkTCM
	tpm1V7N3zAbP4M+Tn5G9AUdPmP04QCAlfFi7L5mZ8bYc1bzD3B09+e+mrrMcv04uecXJ5kKCv34
	=
X-Google-Smtp-Source: AGHT+IG7r32GB0pA0Ts3g4wgGa3QVWzhc83mtuHdo3yIaMhoK2P1BLh+o7db2r84DI6lNYO5Ztelcw==
X-Received: by 2002:a05:6808:f8a:b0:3c9:147c:bd22 with SMTP id o10-20020a0568080f8a00b003c9147cbd22mr40220oiw.29.1714660990414;
        Thu, 02 May 2024 07:43:10 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id e7-20020a056214110700b006a0d5ba108fsm393963qvs.109.2024.05.02.07.43.10
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:43:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 2 May 2024 10:43:09 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm nanbield update
Message-ID: <ZjOmfV3IZ1rHBAn2@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 14:43:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5691

meta-arm has released an updated nanbield support tag, 4.3.1.  The tag 
contains 26 patches from between 24 Nov 2023 and 12 Mar 2024.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.3.1) with a yocto-x.y.z tag (i.e., yocto-4.3.1).

Thanks,
Jon

