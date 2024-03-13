Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A64C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 13:38:21 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.17159.1710337101429460497
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 06:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mV2z60hn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7882d713f6fso327571185a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710337100; x=1710941900; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5uajAduSHjKHmti/zE6S0Z6g1XlOI951GO1ElzA7wgU=;
        b=mV2z60hndK7+kN+e+QpGa+d8jlrrXM31Lwk/n3XnsE8kDD2Ut9Xxi2hKGKrRVinoW3
         PTDIcsGrj+T+GrvC719QxsZbD0KTxmMXyAFZBRox7zGcVr+8pkzrWKcyCAGqqBbeFLza
         QEfZVuPtij0rhZdZehjaNDl8RH8BTq01eEOLy/9CZsD6jtZe58Nf4x/jG3PpN0N8SMtp
         fzDvTOd+AQT+tRm1x4CbqnvmQOnzHlvn/iDlyJM9HzAKblRCCdZtZSGzMCcqeOpWFIn1
         0U3nNiTckcx0u12uFs/MXukHZpSlXzTgqqzN3wQWEIkqJ2FF7PElmlFuMHF4DB06XhgT
         fJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710337100; x=1710941900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uajAduSHjKHmti/zE6S0Z6g1XlOI951GO1ElzA7wgU=;
        b=MBZFxfEFn6l/178mvnS9nsbX/BUSY86ORj0+IDqHSDcOhTa+xR6+oFb0l5svt8Rn3p
         OjyH08Bdl1MvluEVf8W+KWUYT0a3gZi2FchcFFADFiL8FNyCYzxW2ZxLpg+nnsKh6eHg
         3hKgGvS0rcXsQRUw1dMpCGGjBkVMMD6oAvVqVBvSI4+2gmuOWAgGmceLn0qjvGxNY5o9
         3Q0Z1ou5ZbR5667WfpDxAQKr5Hoi2+9m4ugMtJlqsZPApHaVNMyqzA6sSEAiYLDhQdb4
         VYfOzXM6ckLp0NVhnXLjyV/rjMx2E4UWw5/9htut2Ks/ET7FluSsGq9aLUalO1GGb6zX
         mp0w==
X-Gm-Message-State: AOJu0YzKy30BteOjpBpTFuMLxi1IdYzSdzpnCNE/RmCLTogNU+sW+EIr
	B/AX2NYxIoaSWj4Pi2p5dYXq25Rn4qcx2duO/AYxGH3MivAqCA2FrTz6WFj6BYcg7p1baNnENzg
	U4Q==
X-Google-Smtp-Source: AGHT+IG4h2NKCSkwejNWr9rqz4A2kd5cKVAB97LWIC0zOLfkfOZfBM6eLe5lMWSW2dc5bZLg7q65qQ==
X-Received: by 2002:a05:620a:5315:b0:788:5780:66eb with SMTP id oo21-20020a05620a531500b00788578066ebmr13966277qkn.26.1710337100362;
        Wed, 13 Mar 2024 06:38:20 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id wn1-20020a05620a584100b00788752162a8sm2322893qkn.68.2024.03.13.06.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 06:38:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH] arm arm-bsp: enable patch-status warnings
Date: Wed, 13 Mar 2024 09:37:13 -0400
Message-Id: <171033703279.1772326.6741704023618653018.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240312125505.1392948-1-ross.burton@arm.com>
References: <20240312125505.1392948-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 13:38:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5429


On Tue, 12 Mar 2024 12:55:05 +0000, ross.burton@arm.com wrote:
> Enable the patch-status warning for meta-arm and meta-arm-bsp.
> 
> 

Applied, thanks!

[1/1] arm arm-bsp: enable patch-status warnings
      commit: e867b0aa6a831c74cf50d23c25a74b68137bc9c3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

