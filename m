Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.37128.1605543376537440797
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 08:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=uRCKtFk4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id q5so17234929qkc.12
        for <meta-arm@lists.yoctoproject.org>; Mon, 16 Nov 2020 08:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=QO5fignoVQ46byRXl3Tw8K1opyWLCMP+lUN+jNBfwwI=;
        b=uRCKtFk41utangpMzkCd1Z2PiFlieX1pGutUYrPqDRT9immqJSx1M23toBpJfzZYky
         8VeOwklgbe2UarHbd1jwTO9OMicEYtTCQS0iVvQ7lBdP+jdELTybj3CK4N+Yyj9jA+lX
         EC8F27JOxBEZFdJyRNdKvvQm/XTEtY2cbJAsvVaLw558TUbqxjgWifwwveFk2Z+61O/2
         dxKx6W/IBqVA/Mlg40o8Q2NiDAACkjxbhj50p3/EUIu7zGaTS6G3ZPMIwn8pNqGTkQLH
         OjIox/qt0ULEiScnayLT3ultCkXvrlaZWpnPJqLZHuxzYI/H2cGQVmh7CEWy7ECL0UD9
         cdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=QO5fignoVQ46byRXl3Tw8K1opyWLCMP+lUN+jNBfwwI=;
        b=YzOPhiG4SD2rrGiQrIr4lJdCye+uT7o+Pfrf+evqn/d97+binLn1yYSJjH1UJuUUxy
         g9CTmAG2DiT8nNTG6zozetc3gkiKd2VxfTLp/2K7dLpAvXIICBAfsBXxwXKvH6Gs8mmM
         1JohCr6PYTo4u3/SzrcMSEZC+HUKfF4hBSqdAQNVi9xtDyu+Wyz5Xv3QOloOF1FjhzU2
         jy7x7pBvnI6OYOm62mup85FrVr6zxwsLTca+CshbwjP+jgZtuvBxL3uuoB+1ZEpN56MK
         FroJs/WRRZN63crWv/uFrySvy2+sQUu41ZO4NjY8hOwsSh/olprCDOr6UpETYlGqALkg
         B23g==
X-Gm-Message-State: AOAM530BSn1F1vtqIEGLN8eycC9mIlLMh+GbYUE7R+yA184UDIttCjzA
	hz72ucc+E40T6lh8aViAKkCmf4bUcR+YWQ==
X-Google-Smtp-Source: ABdhPJzijpsz0c8AVr8ogt+B/+iSa+T9liPYH8Nakg9j28lLZ7bhY9FFvtBqd5luq1sbxEdcHnsRXw==
X-Received: by 2002:ae9:e007:: with SMTP id m7mr14812744qkk.416.1605543375339;
        Mon, 16 Nov 2020 08:16:15 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:8d8f:f072:1037:de6f])
        by smtp.gmail.com with ESMTPSA id p12sm12236199qkp.88.2020.11.16.08.16.14
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 08:16:14 -0800 (PST)
Date: Mon, 16 Nov 2020 11:16:13 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: Dropping older, unused versions of packages in meta-arm
Message-ID: <20201116161612.GA31482@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the near future, we are planning on dropping recipes for older
versions of existing packages in the master branch.  For example, we
have recipes for the current (3.11) version of OPTEE OS, as well as 3.8.
In this example, we would drop 3.8 while continuing to make available
3.11.  We will go through all of the existing recipes, updating as are
available and removing the older ones.

However, we do not wish to break anyone using the older versions.  So,
if there are specific versions needed, or you wish to object to this
entire idea, please let us know ASAP.  Removal patches will be on the
mailing list and will only be done with public approval (or silence).
So, people can speak out then as well.

Thanks,
Jon
