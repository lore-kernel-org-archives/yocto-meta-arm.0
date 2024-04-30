Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4F8C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 03:22:01 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.6688.1714447313379604002
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 29 Apr 2024 20:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Cyc2cpCd;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-790c7785ddbso200099685a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 29 Apr 2024 20:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714447312; x=1715052112; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YBwpQSEkoOE3WCz3clktap8TD4wF13VF4Zokq0dvmI=;
        b=Cyc2cpCdQXEjZa30oqxvfRSyY9RNYYdVJjUpF2n4cJq7owbW48XaUPKmvpGjBfUqbv
         Ge2d+fhif1qHN2w0Ro2ngOG/Qyu1fmi1mydITG+ypjSBKPw9XjIXZVGnUWTMyEQfwY/9
         Q9PZtub7JVzZM+cwI++lIE0RFS0PGkxAwMirLUUQR8Ct+/bCeezk2HjcPchJV7PFHV7T
         dbB5JlohJ37kW4GdQdqIINct0DUs+T5c7Q9BVw/mswVEWdDON/bSDrJoxldtA0BOTb7d
         Zp9Bf/aDyAH1ViBJ8KNxn3goreqJWq4Lj88JZb3kHwyE72B4E0tOKT+5eRJlvkwPm5jR
         KmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714447312; x=1715052112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YBwpQSEkoOE3WCz3clktap8TD4wF13VF4Zokq0dvmI=;
        b=JHRgb8eRuYvYGx6WnEV2Qx1MxlOk5Li4eK4saOhrS+MDS4o8f6hTNJlfJBmre5RcCJ
         sBsE43k0txjxgfKSP1Tf/qkTTi4x/WY/BZ8Ek0Ojat5VA9EKrKnCpQiUsojs+lYjHM/6
         ka6ls6OSyHrooEBnuFkyueuHXxxMD2ZWxC+i2CcGGtGpgjY8VET9Mixjgy8VDmi7jaMz
         BlmUJ5K7FGOsULR1PXKGSQVO9aZ4pq2BrjMgF6UJwETwP5IdTEmY/Z6/J9PRKAUl2CHa
         53EKdUGzig8QUxng36rZFNslSgkB52XvRzQrZ8Xb50POLhR02u9x32aEcVXD6Eg7aPtH
         9D/Q==
X-Gm-Message-State: AOJu0Yy0zYRR6DJMUcCtnBN0UU6URfj/Qs9/e9micpsHy6sAxJGwyAO4
	Ju4VPryND+5Sm5iCmtyKkeTPy4KBnuafTJVD+ffxJg/fPDS64hHxPdWIPljtIBoWQpm6K/1oL5s
	=
X-Google-Smtp-Source: AGHT+IFasbf7tJa/zGZ+5UaHr7VuUOysvQmNlG0C8pQMof+bueQ9OOIrnzB4GRDGof0o7cjeBxdefw==
X-Received: by 2002:a05:6214:d08:b0:6a0:67ae:784 with SMTP id 8-20020a0562140d0800b006a067ae0784mr1028195qvh.65.1714447312029;
        Mon, 29 Apr 2024 20:21:52 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id y17-20020a0cead1000000b00696b1050be8sm3005491qvp.133.2024.04.29.20.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 20:21:51 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: use scarthgap branch for meta-clang
Date: Mon, 29 Apr 2024 23:21:04 -0400
Message-Id: <171444726772.3765152.16782553915483520730.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429130333.36393-1-jon.mason@arm.com>
References: <20240429130333.36393-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 03:22:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5634


On Mon, 29 Apr 2024 09:03:33 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] CI: use scarthgap branch for meta-clang
      commit: b972dabc1b5b25ff88df462a9745d7df0aa77512

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

