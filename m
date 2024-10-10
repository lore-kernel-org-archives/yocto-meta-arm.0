Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A05CFC5FB
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:13:12 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.52620.1728587591777630374
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 12:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Y9YYXQWr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e330a7b120so11076297b3.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Oct 2024 12:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1728587591; x=1729192391; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxT6PhpeeGwxn1UfQbAe3W5sIYKHcSYq0sluCr8UyaU=;
        b=Y9YYXQWrrFh54bSmkh6X3k9QDWpbzuqNBoWbV74CY0Y1l+7OjZ3Hr5m5IIQ/FyvRLg
         wYJdxYTJQnvQc4cRgWVm5p698jLTnGXortlw5JuuUXxN6asUjLv4qYFUCGr14fxGR8Yv
         +i8QndWaE6KzHEDt0vdKhnSIFvOUNKtTzYSB0JRPd+QkJZuPfi2U3zHAUZPiUBpGEQDE
         pUTHdnaR+GL15wWft555yClVo0tiyZw5SagvdjnOuu/XHOz4DLqSo54yVfsjbFEKZaHc
         V7QOy3onAWLi6AvPfIx2Ltd9WCBZ3xdbi0OQSwz6c+MZuEVTkGSPD4WOJrCwm04GU80g
         Z66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728587591; x=1729192391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxT6PhpeeGwxn1UfQbAe3W5sIYKHcSYq0sluCr8UyaU=;
        b=Vk9Eqn0r+h2f3DIV3i+ex8D1iXDe4RopzK/20z6CSrDvhTIu9xzcpychlDxXPOdSaT
         w8w4LzRqaO4SZHQAFwBTWlZtrRRPJmhkSaov4/nL6mTK2DMphvrmO71CMS/YUB+d2/3V
         WP7TDiVuMqLm/nByQcZwExbmA+lYWU2TfikpIitkUQSttN2mrlTA9WS22CSr3wUvQs/Y
         yajdYtN3aNj31OZrptXZ8EYI+AKOk3sO24DDBbqzz7+jUdB978P0+BmhS4s3MFfGbgLt
         hLw93FpPFYrIhruDJiXjUzCytmM7rnb/1KSJ7C5wOdSBJqtvFjc1xB9hnmG5B51KnArw
         v1zQ==
X-Gm-Message-State: AOJu0YzNZV0nCHqDpQb2eEQUrrKOPwQe9yAXLRyK6aK5q+X1AyQTgTc5
	n43T2FioR3I/lYIqsgJWj1cT0o4vNrj7kkszSNouD+rQb0fXgq2zQIGWqqC3nQxT6O9vu+mFVLA
	=
X-Google-Smtp-Source: AGHT+IHUGs/goN9nNYtuX1dmEentslaq4+lV46sAuhWlhqzpXwrGRqo5wmEaf5xxZhuhGC2uOVMJUg==
X-Received: by 2002:a05:690c:85:b0:6b9:d327:9ad6 with SMTP id 00721157ae682-6e3224d1eb6mr84244237b3.33.1728587590791;
        Thu, 10 Oct 2024 12:13:10 -0700 (PDT)
Received: from localhost ([136.56.18.214])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8638c15sm8118546d6.129.2024.10.10.12.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:13:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] layer.conf: Update to walnascar (5.2) layer/release series
Date: Thu, 10 Oct 2024 15:11:40 -0400
Message-Id: <172858750055.591681.7845853986136797878.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241005023818.1689930-1-raj.khem@gmail.com>
References: <20241005023818.1689930-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Oct 2024 19:13:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6188


On Fri, 04 Oct 2024 19:38:18 -0700, Khem Raj wrote:
> 


Applied, thanks!

[1/1] layer.conf: Update to walnascar (5.2) layer/release series
      commit: 72546aff8917ba145a265255a722a073c95ae296

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

