Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE66CD11BF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 13:56:22 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.45091.1710942982386807898
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 06:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=QsANcly7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-787edfea5adso279803085a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710942981; x=1711547781; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E13EH5tqhJJVTbDuNYSeSxxQnfkp5Hifj2b1GFzvMVA=;
        b=QsANcly7t1bNKyN+rfp084lQaXgRkdlvDOad4cor+RK+FrKdqlpCzqBU12cUiJ3WSC
         9j6tVJ7i/ic4XwGUoHiUB8Vqdb8dwEV0RPcTtRbDbbk8fKT02MyDUJMXMDCGgN/p8SZk
         mmkM6HAr2UKCO0D1yFyss0eEvEgSKcKatpPTk7GiPgawM11/irIEatOoujsl0KX/mUKY
         0RA6lBFmakHiYVjPSCi9e34VfFyoDkQl4PxikUW1J6x0WDpDhRmNjTW5UNzNIQ4RY3TL
         lQqNBG/8qVPUhAyUyU9YE5Fk8VWHwhLQa+ryXUOOEz8a/chqNR9RnYYL6qrB+u0mVQ+t
         hJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710942981; x=1711547781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E13EH5tqhJJVTbDuNYSeSxxQnfkp5Hifj2b1GFzvMVA=;
        b=CnCtWWKlo69VzrPg9ixrUMiW/ezlpA0EGG894dAFumM/VY+RwhXq01n1r6qSk5GvWG
         kiPDkN8BJgH5g3vUnykJb5O2StSRPZbxy+dnW0PrHoc2cAny/tThIOYLwOWVH0EfcO+m
         u9jxj9D2rKlm5FYqFSRZzwX2gfPVoCGy3pbSISgV55G0AU7Poj7+aw/O/AifTb4Opwmv
         DUhqz008f8GHpoG28mm31fhRl21qr68otgT4xUrsLx2pEsv6u2DeVfG1DfrTZMp+UJG6
         GGMKY6Gtql1RsKJux8kKjzVPqwB/7ZM3HOR+/HBbI9VyLT67AAfLjmf1tCCZV7y/IVa4
         bLTw==
X-Gm-Message-State: AOJu0Yxu3hryVYukavQkldk5AJiAxjp6zcbWgbR1Z7hwFOvp0QeFozW4
	Gg6+mtUhs+msF/P78wL5Iv/pBYY9MBugV61+eo9Hg1qQ1DWvNsHc1DHXF5/rN4gEe3MVYVz6Gj4
	=
X-Google-Smtp-Source: AGHT+IFlXxcUJ0CUgL5mC8ZBna25vITRMyXhVB4ulVf9sCUAyoj/SLo4hXBQ+fPbA4hhBxPfgOxESg==
X-Received: by 2002:a05:620a:b18:b0:788:1b28:b977 with SMTP id t24-20020a05620a0b1800b007881b28b977mr19851268qkg.39.1710942981245;
        Wed, 20 Mar 2024 06:56:21 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a094800b0078a210372fasm699400qkw.86.2024.03.20.06.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 06:56:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/tf-a-tests: remove corstone1000 intermediate SHA
Date: Wed, 20 Mar 2024 09:54:32 -0400
Message-Id: <171094287482.3509794.5561232763103339828.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240319145905.27609-1-jon.mason@arm.com>
References: <20240319145905.27609-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 13:56:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5462


On Tue, 19 Mar 2024 10:59:04 -0400, Jon Mason wrote:
> Things are now building for corstone1000.  Remove the intermediate SHA
> and let it run the latest code.
> 
> 

Applied, thanks!

[1/2] arm-bsp/tf-a-tests: remove corstone1000 intermediate SHA
      commit: a19c7d7b762ebfdbf8eed003c0d8ee077d0bc85c
[2/2] arm-bsp/tfa-tests: move n1sdp patch to platform directory
      commit: 59b79d5e92ab0c6005be96108d926e949cc7c152

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

