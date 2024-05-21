Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1991C41513
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 14:20:55 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.20891.1716301249989634193
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 May 2024 07:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=s31Fl3WO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-792b8d98a56so335172885a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1716301249; x=1716906049; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6UTWPcf2ybipkT65y1HxJs+ccrCs1Yjv6OY0X+/dik=;
        b=s31Fl3WOAplNsOKs42a4w87dXW2cwI3jzKouL3xc62SGFsuxiV0K1/PH+tkA2/uUP5
         DPVbncjwCxrk8UO4TQwXf8uk0AwIytZOTAVGeMp8LqIZMSJ85fAEzYcNoyo3e+fjsTRB
         34eCUv2ROo/26f4eAxdJXz/w2oQQHL61A9vVUnG7QwtWcQ5UnBS7UuuAPqQGg94ydMKc
         GmjPNmZ8ZiT8RtYnTqAmla7wrlL+Wz+NWIx9/rKlsVrc5lt7JGL6PNm4PRW8HLyIAhqw
         8rX6+f2fSu+GimpEr0d0L4/nqyquGkoA9d5hzMm11hhzBPAWC0WC+wjfyDETH9HR82ti
         hcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301249; x=1716906049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6UTWPcf2ybipkT65y1HxJs+ccrCs1Yjv6OY0X+/dik=;
        b=b0ES/8e9GN1oT5MuJklmwl6gKroS0FC/4uodSAb1EtRcyIM+nIUtcbgmavK2XCgFoH
         R18UNzVQdez5b01yNZtXLqiHyhU/QQu2iUfw6Dl94GsS7BvQ7LOyVbij7GWYltOmPgFO
         xioSwt7gfnLIFN0rDpX+6OJnaNc7jJ5EmzpvoEETmRhEGzkJo88+fy7Slkrt9EqLJIAM
         oJFv30Ch+FuxzPUf8x5p1cxrvAWfKFOXrQsSjHNY+XxRT/EqaZU80Mt0qAI4CF9NBFrl
         aPjDEzbgRlE3zVjOa2gPM41v5+Jy76a5swkLPBfZUs2Mh9EiAcl4IszVExbEztB/5Uyv
         5/2A==
X-Gm-Message-State: AOJu0YwkQHF/Gy74f2zN6A+PoEKa7ggoZTVN0nU/tqs12+KBdgZBjdNK
	K9P2MX9/X9OMAt/npO9K7L/Sgg6LbHK8J0njUw26cISW2EA9e9HdHEAPO2NPBUQOmprTUni2VOQ
	=
X-Google-Smtp-Source: AGHT+IHnUnPbd3Uz1xBzAFCGDvcmGqhR8XUnCfAXC2L1QsypZ+LrjUD1cLt37ikyFMMJZI0a3bO6/g==
X-Received: by 2002:a05:620a:201c:b0:78d:67de:50a0 with SMTP id af79cd13be357-792c75af7f1mr3341880385a.44.1716301248744;
        Tue, 21 May 2024 07:20:48 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2a4290sm1286686685a.65.2024.05.21.07.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:20:48 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH scarthgap 0/1] arm-bsp/documentation: corstone1000: Update user guide for secureboot test
Date: Tue, 21 May 2024 10:19:50 -0400
Message-Id: <171630119060.2318166.11841229460228437877.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240517102622.3067719-1-harsimransingh.tungal@arm.com>
References: <20240517102622.3067719-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 May 2024 14:20:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5744


On Fri, 17 May 2024 11:26:21 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> This changeset updates the user guide to test the secureboot for both the
> Corstone-1000 FVP and FPGA.
> 
> Harsimran Singh Tungal (1):
>   arm-bsp/documentation: corstone1000: Update user guide for secureboot
>     test
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Update user guide for secureboot test
      commit: d02467366d36b9e0bd16beaccf8c89fcd8c480a8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

