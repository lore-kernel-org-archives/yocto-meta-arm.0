Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98419CF3968
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:05:04 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.2776.1726776295255641752
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Sep 2024 13:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ultuzI/j;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7a9a3071c6bso119419185a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1726776294; x=1727381094; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c461uLHVCYxwf4tOAbUGINWUAJuyhpkPvwAQ37pe52s=;
        b=ultuzI/jMonl2h97kCvnUlM8QfkgJtZkJrlSHK97/AkfW8VOof/DMKrXQhgL3zZxa7
         c8GuiqmmmYBnNfWrj22bSTeLGbCfsYqJlNDR25a1az3syETE3P4fq5q5shGrggzxUo9j
         ufL5BlmAVdK2T8YK6VLMrChZlZ/u3SzFZ2GBJtPznZSZ9wst++AQRTRJ9YSd3Sj1WKGf
         uz5EvpDtIDay3KOQtpEsnXEySKP9zmUyQQhbcnkBL4zlqY804jj3AXdpGmin19QMMudR
         rETK54/ish/M/lYscrw2HwWf0LkGFXa718lrtDVtgAd539eauPQQBcfOa9gVihuRC3Ka
         YZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726776294; x=1727381094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c461uLHVCYxwf4tOAbUGINWUAJuyhpkPvwAQ37pe52s=;
        b=L23wMlvrBpaevMERIizYmqNGmV56k1eQORsFgi/GldI6iFpcK0zfvskrkAkOosiun3
         +8EKobBkqqy8ZYq2BvooX1noOaDaUDdxKsOc50sopmiH9YdlrFui2WVx6Vxsmy+dFQdP
         VEQ7/EWKD26i7oBaIQgrQl6YYmHF3B3wvdDOgxTuQAXJickmwKKS3W0oFx7hJzhcEHAB
         dC1oeyBOMt3qqbifbA6EhEUdHDsVC8VY+QaUqBbelO+U4WnjCN22p6CVFF+VzuNJk8t+
         fAYp/ZQtaUFROJP1K1zp65H9EdyaIbLyCe3ojF88uZAr590ZIC7tTO9Nt8QBKKdK5tX+
         GOZg==
X-Gm-Message-State: AOJu0YznmvMXSLq5HGzIwI2ciN8GoEsKQkKujw7nJajKP3Foqxp0iR4d
	mMJcbyW3nsaIk4hlEwqJeB93RDSbQzEJs+wv1eA3J4WoBNUzdgq6BtC6r1CRmiI2qh2WUPN4zt0
	=
X-Google-Smtp-Source: AGHT+IEB2HlkdkGqAINpy1e6S7aVa/jmClFiD+P8J1HTv1F9aJ4OkmVlZNwgJSeD6zu/1Y1Akwp86g==
X-Received: by 2002:a05:6214:4a89:b0:6c3:7047:71f5 with SMTP id 6a1803df08f44-6c7bc80e709mr7668236d6.49.1726776293958;
        Thu, 19 Sep 2024 13:04:53 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c75e586d10sm10416566d6.141.2024.09.19.13.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:04:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-toolchain: remove libmount-mountfd-support when using binary toolchain
Date: Thu, 19 Sep 2024 16:04:27 -0400
Message-Id: <172677626880.3549922.14508379959374383749.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240919151026.76035-1-jon.mason@arm.com>
References: <20240919151026.76035-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 20:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6091


On Thu, 19 Sep 2024 11:10:26 -0400, Jon Mason wrote:
> util-linux is failing when compiling with:
> | configure: error: libmount_mountfd_support selected, but required mount FDs based API not available
> Remove this feature when building with the binary toolchain to avoid
> this issue.
> 
> 

Applied, thanks!

[1/1] arm-toolchain: remove libmount-mountfd-support when using binary toolchain
      commit: 45a2b44284444aaf89e03c40258f876785425582

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

