Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121EFC38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 04:15:07 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.6497.1720584895119684312
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 21:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=crdDKw4G;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-655fa53c64cso36481177b3.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jul 2024 21:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720584894; x=1721189694; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1D2xpcIiCjsaIIT/lO4KbnHWRdYzOArWOFreRyw4lA=;
        b=crdDKw4GGylUYSZqkev9mELipJeVhyCXU1Evb7VOUstY3Bz9fidHDK6h/60M9Fkps4
         vm9EZ5TXUzngrTjuLUcXLjLVAWr3X5wSuspN+xwaoOIoEd4BRsRrdwobELDsApC+X8y/
         K50QxYV+cSSeanRzlKSgUpatDBrZTNcnOPZ3trSc8j0jAQib/2v7lqE+FqOf8WiP5PrH
         BpnQgUesLCAjt9xWLbXt7c5PIOSptipedp85dPvH51P4ZSJ6rWP+mGpLiNY5tm6tsIG2
         1BIbhC+Qd8xhjohN0CRISaPh3WPJSc7XiNSUXvpzspeZn4RsWHAAsLh306u5V8+FkdeT
         4TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720584894; x=1721189694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1D2xpcIiCjsaIIT/lO4KbnHWRdYzOArWOFreRyw4lA=;
        b=OnrqKbXRwOScupNzaI2aNWKorlhOdhl6Lt1F2ir4RCczyVd0W2JNnVjmqIdqy7Qwnv
         2pJLwOHgc5/FLQUDwcXuxdfoQP6UXAmRMqMl7qbhHFqS6g3/UEz2WKxxXYVoartaPDuB
         qv90/4vxmwjUVNIJYahgEFREEOeZWEvv6vEt3qV1+fPTPRxKwCJ+pl6/lYattfsjG4rK
         Xt9fs8gDzHFjtnG5m1j/wdOIqkkXH5uejt1pybH8kPkLgMSIyABLSGZSpwxYxaJrF9n/
         cxkOhgcWsEI3Kf6HcW22UihAwkl+6+oYCZIWttUJ+a1ngfVsPHXSo2CChlBbatUCtZID
         xUQQ==
X-Gm-Message-State: AOJu0YxUhDkPtyIESEtS2I62L6qajBd4Q5iI5pkLsimj0+1MNFU8p3tk
	xTnWiQoTKHGaPd4WYyuSHgdHEuHw6BasVL85lW9zZC8yME5y/hZgv2SXob+1WMsdMd3fLjH07e0
	=
X-Google-Smtp-Source: AGHT+IFQ5eic9i25k75Lz7VYaDOxGfDXYfPGzyIqepys/ewR5Y7Ksp8CQh6EHLnYALA4rtqJwXPS7g==
X-Received: by 2002:a0d:c8c2:0:b0:61e:a26:c1b2 with SMTP id 00721157ae682-658eec68cc8mr44809547b3.17.1720584893911;
        Tue, 09 Jul 2024 21:14:53 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e64ed0d6sm5975817b3.86.2024.07.09.21.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 21:14:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-toolchain: update to 13.3
Date: Wed, 10 Jul 2024 00:14:48 -0400
Message-Id: <172058488959.1547809.8319004246144967612.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240709182810.33299-1-jon.mason@arm.com>
References: <20240709182810.33299-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Jul 2024 04:15:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5876


On Tue, 09 Jul 2024 14:28:10 -0400, Jon Mason wrote:
> Update the Arm Binary toolchain to version 13.3-rel1.  The upper to
> lowercase 'r' in rel was intentional, as the exact match is needed for
> devtool to properly determine the correct version.
> 
> 

Applied, thanks!

[1/1] arm-toolchain: update to 13.3
      commit: f646ee450748fd536c79f068cd5256d50568af89

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

