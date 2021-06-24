Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.5573.1624529861522811098
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Jun 2021 03:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=osLWjZjv;
 spf=pass (domain: burtonini.com, ip: 209.85.128.45, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f45.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso5867653wmh.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 24 Jun 2021 03:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lNMM1+RWqwCAjlC68FG5HSkh5XSz9v8f+kCvo7ecVxY=;
        b=osLWjZjvnr/t/ab92mO8lOxl2ne3I30uLulVPW/8mUnLAXJTm3PqxgIe/64fLli4n7
         hAdzhGNsD7DqjPz5u+tA+D8TlDHe18e4NsA60pfiXSpHQwNiwkSO8/6eX3ruVL2xK7QR
         uOxhIfKd6LlCNgInsb6ujQxO/PK1nJNvEZznRphAqrqWYttElQy01FKABZhqhG9ehW+e
         JPnbSEYCOTLmeDeuqCbqt0ZlRfeJGZzOpdomF8bogzEXGBN3PpLOF+i4maU+JroM7ZoY
         kc5H4woneGOwPQPScusOMNEksLq5NjTNJrjV1xngvGPJZvyZ+gl6wAqDf6AJTNuPVr6N
         oGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lNMM1+RWqwCAjlC68FG5HSkh5XSz9v8f+kCvo7ecVxY=;
        b=adVQDq9CDWjBygIwffzhvkMTmzXglideqNR0+4QjjG4G9m/UJaVUt0HfjaGrpkzQ1y
         MHIOI487l1ivifyjKDG7VruvUB2L2NkH+Vj10mSVUbZoB4gDiecuXUnCFob4TxXOxvp5
         zr0CFHLivGl9q8j5qtBh/EPPyBfe2/MLyqBs10gqfV9iSytWXZKQXfpJyb5OegXQaOOP
         cgjGH0fQrIkQOsYvrniIq47LCgVRpowF2jmfHowSdFPjQ246FGM1BltuhmgjTw4qdBfY
         ozrsD1vNePd+TMMdQlucnig1rDSdJ6cdMsXmODJQJsdz2wpJQqMiyk3apKIQXl3BShJX
         08CA==
X-Gm-Message-State: AOAM5304beynWPDu4OMSw87YosxIJ5/Y+Ye/ONeQzq633+5HU4w02uHW
	sfCy1PZvgThPOG5OO1YpUw6PUbcqdoXZOtBOSX6EtMbXLIHsRw==
X-Google-Smtp-Source: ABdhPJyJF9937mLQ3647/TkG0oWfiqUZzpj9/HG9jhFyVTSnSkqWXLTsjJV8hM0JhLgKI9ineR2cGajLDdmRY/hcjaI=
X-Received: by 2002:a1c:7510:: with SMTP id o16mr3391247wmc.137.1624529859921;
 Thu, 24 Jun 2021 03:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210623122814.1467189-1-ross.burton@arm.com> <20210623122814.1467189-3-ross.burton@arm.com>
 <20210623192228.GK1528@denix.org>
In-Reply-To: <20210623192228.GK1528@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 24 Jun 2021 11:17:29 +0100
Message-ID: <CAAnfSTsPbVdCR4C_mf0FhH4XN2MZMSGT0Duh0cXrUMGkEX66BQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH][hardknott 3/3] ci: add yocto-check-layers step
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Jun 2021 at 20:22, Denys Dmytriyenko <denis@denix.org> wrote:
> Thanks! Do you need these changes on dunfell as well?

Step at a time...  Dunfell passing in our CI needs some further
changes to oe-core (which fails to build on arm64 hosts).

Ross
